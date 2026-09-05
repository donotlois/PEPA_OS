param(
    [switch]$Watch
)

$SourcePath = Join-Path $PSScriptRoot "Pepas_main.rm"
$OutputPath = Join-Path $PSScriptRoot "index.html"
$CssPath = "./style.css"

function Convert-InlineMarkdown {
    param([string]$Text)

    $encoded = [System.Net.WebUtility]::HtmlEncode($Text)
    $encoded = [regex]::Replace($encoded, "\*\*(.+?)\*\*", "<strong>`$1</strong>")
    $encoded = [regex]::Replace($encoded, "\*(.+?)\*", "<em>`$1</em>")
    $encoded = [regex]::Replace($encoded, "\[(.+?)\]\((.+?)\)", "<a href='`$2'>`$1</a>")
    return $encoded
}

function New-Slug {
    param([string]$Text)

    $slug = $Text.ToLowerInvariant()
    $slug = [regex]::Replace($slug, "<.*?>", "")
    $slug = [regex]::Replace($slug, "[^a-z0-9]+", "-")
    $slug = $slug.Trim("-")

    if ([string]::IsNullOrWhiteSpace($slug)) {
        return "section"
    }

    return $slug
}

function Convert-PepasMain {
    if (-not (Test-Path $SourcePath)) {
        throw "Source file not found: $SourcePath"
    }

    $lines = Get-Content $SourcePath
    $body = New-Object System.Collections.Generic.List[string]
    $toc = New-Object System.Collections.Generic.List[object]
    $paragraph = New-Object System.Collections.Generic.List[string]
    $inFrontMatter = $false
    $frontMatterDone = $false

    function Flush-Paragraph {
        if ($paragraph.Count -eq 0) {
            return
        }

        $text = ($paragraph -join " ").Trim()
        $body.Add("    <p>$(Convert-InlineMarkdown $text)</p>")
        $paragraph.Clear()
    }

    foreach ($line in $lines) {
        if ($line.Trim() -eq "---" -and -not $frontMatterDone) {
            $inFrontMatter = -not $inFrontMatter
            if (-not $inFrontMatter) {
                $frontMatterDone = $true
            }
            continue
        }

        if ($inFrontMatter) {
            continue
        }

        if ([string]::IsNullOrWhiteSpace($line)) {
            Flush-Paragraph
            continue
        }

        if ($line -match "^(#{1,6})\s+(.+)$") {
            Flush-Paragraph
            $level = $matches[1].Length
            $headingText = $matches[2].Trim()
            $id = New-Slug $headingText
            $body.Add("    <h$level id='$id'>$(Convert-InlineMarkdown $headingText)</h$level>")

            if ($level -ge 2 -and $level -le 3) {
                $toc.Add([pscustomobject]@{
                    Level = $level
                    Id = $id
                    Text = $headingText
                })
            }
            continue
        }

        if ($line.TrimStart().StartsWith("<")) {
            Flush-Paragraph
            $body.Add("    $line")
            continue
        }

        $paragraph.Add($line.Trim())
    }

    Flush-Paragraph

    $tocHtml = $toc | ForEach-Object {
        $className = if ($_.Level -eq 3) { " class='toc-subitem'" } else { "" }
        "    <a$className href='#$($_.Id)'>$([System.Net.WebUtility]::HtmlEncode($_.Text))</a>"
    }

    $html = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Technical documentation for the smart irrigation system based on PEPA OS.">
  <title>Smart Irrigation Systems - PEPA OS Manual</title>
  <link rel="stylesheet" href="$CssPath">
</head>
<body>
  <nav class="toc" aria-label="Table of contents">
    <strong>Contents</strong>
$($tocHtml -join "`n")
  </nav>

  <main>
$($body -join "`n")
  </main>
</body>
</html>
"@

    Set-Content -Path $OutputPath -Value $html -Encoding UTF8
    Write-Host "Generated index.html from Pepas_main.rm"
}

Convert-PepasMain

if ($Watch) {
    Write-Host "Watching Pepas_main.rm. Press Ctrl+C to stop."
    $lastWrite = (Get-Item $SourcePath).LastWriteTimeUtc

    while ($true) {
        Start-Sleep -Seconds 1
        $currentWrite = (Get-Item $SourcePath).LastWriteTimeUtc

        if ($currentWrite -ne $lastWrite) {
            $lastWrite = $currentWrite
            Convert-PepasMain
        }
    }
}
