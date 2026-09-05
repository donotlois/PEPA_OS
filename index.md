---
css: "./style.css"
config: "./config.yaml"
---

# Smart Irrigation Systems - PEPA OS Manual

## Introduction

**PEPA OS** is a lightweight operating system designed specifically for embedded applications that require reliability, simplicity, and low resource consumption. Instead of offering the full complexity of a traditional Linux distribution, PEPA OS focuses on providing only the essential components needed to run automation workflows, sensor networks, and control systems on small hardware platforms. Its minimal architecture allows rapid boot times, stable long-term operation, and efficient management of microcontrollers or compact single-board computers. Because of this streamlined design, PEPA OS is particularly well suited for scientific experiments, IoT deployments, and prototypes that must operate continuously without unnecessary overhead. In practice, it acts as a small, efficient brain that enables devices such as ESP32 boards or Raspberry Pi modules to execute scripts, manage irrigation systems, communicate with sensors, and run tools like Node-RED without the burden of a full operating system. By prioritizing stability, simplicity, and low energy consumption, PEPA OS provides a practical foundation for embedded projects that need to remain flexible, reproducible, and easy to maintain.

<figure id="fig-logo">
  <img class="logo" src="./image/logo.png" alt="PEPA OS logo">
  <figcaption>Fig. 1.1 - PEPA OS logo.</figcaption>
</figure>

As shown in <a href="#fig-logo">Fig. 1.1</a>, PEPA OS is presented as the base system for this smart irrigation manual.

## Basic Concepts

### Architecture
