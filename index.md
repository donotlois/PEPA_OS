---
title: "Smart Irrigation Systems — PEPA OS Manual"
description: "Technical documentation for the smart irrigation system based on PEPA OS."
author: "DONOT Lois"
version: "Pre-release V.0.1"

language: "en"

translation:
  enabled: true
  source: "en"
  target: "fr"
  automatic: true

css: "./style.css"

theme: "modern"
layout: "documentation"
width: "wide"

toc: true
toc_position: "right"
toc_sticky: true
toc_depth: 3

dark_mode: true
smooth_scroll: true
responsive: true
---

<style>

body {
    font-family: Inter, Arial, sans-serif;
    line-height: 1.7;
    background: #f8fafc;
    color: #172033;
}

p {
    text-align: justify;
    line-height: 1.8;
}

h1 {
    font-size: 3rem;
    font-weight: 800;
}

h2 {
    margin-top: 3rem;
    padding-bottom: 0.6rem;
    border-bottom: 1px solid #e2e8f0;
}

h3 {
    margin-top: 2rem;
}

img {
    display: block;
    max-width: 800px;
    width: 100%;
    margin: 2rem auto;
    border-radius: 16px;
}

figure {
    text-align: center;
}

figcaption {
    color: #64748b;
    font-size: 0.9rem;
    font-style: italic;
}

pre {
    background: #0f172a;
    color: #e2e8f0;
    padding: 20px;
    border-radius: 12px;
    overflow-x: auto;
}

blockquote {
    padding: 15px 20px;
    border-left: 4px solid #2563eb;
    background: #f1f5f9;
    border-radius: 0 10px 10px 0;
}

@media (prefers-color-scheme: dark) {
    body {
        background: #0b1120;
        color: #e5e7eb;
    }

    h2 {
        border-color: #263244;
    }

    blockquote {
        background: #1e293b;
    }
}

@media (max-width: 700px) {
    p {
        text-align: left;
    }
}

</style>


# Smart Irrigation Systems — PEPA OS Manual

## Introduction
**PEPA OS** is a lightweight operating system designed specifically for embedded applications that require reliability, simplicity, and low resource consumption. Instead of offering the full complexity of a traditional Linux distribution, PEPA OS focuses on providing only the essential components needed to run automation workflows, sensor networks, and control systems on small hardware platforms. Its minimal architecture allows rapid boot times, stable long‑term operation, and efficient management of microcontrollers or compact single‑board computers. Because of this streamlined design, PEPA OS is particularly well suited for scientific experiments, IoT deployments, and prototypes that must operate continuously without unnecessary overhead. In practice, it acts as a small, efficient brain that enables devices such as ESP32 boards or Raspberry Pi modules to execute scripts, manage irrigation systems, communicate with sensors, and run tools like Node‑RED without the burden of a full operating system. By prioritizing stability, simplicity, and low energy consumption, PEPA OS provides a practical foundation for embedded projects that need to remain flexible, reproducible, and easy to maintain.

<figure id="fig-logo">
  <img src="./image/logo.png" alt="PEPA OS logo" width="300">
  <figcaption>Fig. 1.1 — PEPA OS logo.</figcaption>
</figure>

## Basic Concepts

### Architecture


V4