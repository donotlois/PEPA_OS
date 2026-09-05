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

dark_mode: false
smooth_scroll: true
responsive: true
---

# Smart Irrigation Systems — PEPA OS Manual

## Introduction
**PEPA OS** is a lightweight operating system designed specifically for embedded applications that require reliability, simplicity, and low resource consumption. Instead of offering the full complexity of a traditional Linux distribution, PEPA OS focuses on providing only the essential components needed to run automation workflows, sensor networks, and control systems on small hardware platforms. Its minimal architecture allows rapid boot times, stable long‑term operation, and efficient management of microcontrollers or compact single‑board computers. Because of this streamlined design, PEPA OS is particularly well suited for scientific experiments, IoT deployments, and prototypes that must operate continuously without unnecessary overhead. In practice, it acts as a small, efficient brain that enables devices such as ESP32 boards or Raspberry Pi modules to execute scripts, manage irrigation systems, communicate with sensors, and run tools like Node‑RED without the burden of a full operating system. By prioritizing stability, simplicity, and low energy consumption, PEPA OS provides a practical foundation for embedded projects that need to remain flexible, reproducible, and easy to maintain.

<figure id="fig-logo">
  <img src="./image/logo.png" alt="PEPA OS logo" width="100">
  <figcaption>Fig. 1.1 — PEPA OS logo.</figcaption>
</figure>

## Basic Concepts

### Architecture


V4