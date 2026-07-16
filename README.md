# Nemo Transfer Speed Graph Patch

A UI enhancement patch for **Nemo file manager** that adds a real-time **transfer speed / bandwidth graph** during file operations (copy, move, etc.).

It upgrades the default progress dialog with live throughput visualization, similar to:

- Dolphin file manager (KDE)
- Windows File Explorer

## What this adds

Instead of only showing *progress %,* users can now see **how fast the transfer is actually performing and how it changes over time**.

Before:
- Progress bar only
- Estimated time remaining

![Nemo Progress Dialog](1%29%20motivation%20%26%20screenshots/classic1.png)

After:
- Progress bar
- Real-time speed indicator
- Bandwidth history graph

| Nemo Transfer Progress | Nemo Delete Progress |
|:-:|:-:|
| ![Nemo Transfer](1%29%20motivation%20%26%20screenshots/dialogue3.png) | ![Nemo Delete](1%29%20motivation%20%26%20screenshots/delete1.png) |

## Overview

Nemo’s default file operation dialog shows only basic progress information:

- Progress percentage
- Estimated time remaining
- File count

This patch enhances it by adding a **real-time bandwidth graph**, making transfer performance visible over time.

## Features

- Real-time transfer and delete speed monitoring (KB/s, MB/s)
- Live bandwidth graph over time
- Automatic graph scaling based on throughput
- Works for copy and move operations
- Minimal performance overhead
- Optional debug logging (if enabled)

---

## Motivation

When working with large file transfers, the default UI hides useful performance information.

This patch improves visibility for:

- Large backups and archives
- External drives (USB, HDD, SSD)
- Network transfers (SMB, NFS)

## Compatibility

- Nemo File Manager
- While Nemo is typically used within Linux Mint (Cinnamon DE), this patch only depends on Nemo and can run independently in other compatible environments.
- [**Linux Mint fork here...**](https://github.com/cori77-hub/nemo_progress_dialogue)

## Notes

This patch only modifies the **UI layer of file operations**.

It does not change:
- file transfer logic
- backend I/O implementation
