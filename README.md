# Nemo Transfer Speed Graph Patch

A UI enhancement patch for **Nemo file manager** that adds a real-time **transfer speed / bandwidth graph** during file operations (copy, move, delete).

It upgrades the default progress dialog with live throughput visualization, similar to:
- Dolphin file manager (KDE)
- Windows File Explorer

## What this adds

Instead of only showing *progress %,* users can now see **how fast the operation is actually performing and how it changes over time** — live, not averaged.

Before:
- Progress bar only
- Estimated time remaining

![Nemo Progress Dialog](1%29%20motivation%20%26%20screenshots/classic1.png)

After:
- Progress bar
- Real-time speed indicator
- Bandwidth history graph
- Delete operations get their own inverted accent color, so a long-running deletion is visually distinguishable from a transfer at a glance

| Nemo Transfer Progress | Nemo Delete Progress |
|:-:|:-:|
| ![Nemo Transfer](1%29%20motivation%20%26%20screenshots/dialogue3.png) | ![Nemo Delete](1%29%20motivation%20%26%20screenshots/delete1.png) |

## Overview

Nemo's default file operation dialog shows only basic progress information:
- Progress percentage
- Estimated time remaining
- File count

This patch enhances it by adding a **real-time bandwidth graph**, making operation performance visible over time.

## Features

- Real-time transfer and delete speed monitoring (MB/s, KB/s, B/s, files/s)
- Instantaneous rate calculation (not a running average), so the graph reacts immediately to speed changes — useful on inconsistent transfers (USB, network shares)
- Live bandwidth graph over time
- Automatic graph scaling based on throughput
- Delete operations use an inverted accent color, giving an instant visual cue that the operation is destructive
- Works for copy, move and delete operations
- Minimal performance overhead

---

## Motivation

When working with large file transfers or deletions, the default UI hides useful performance information.

This patch improves visibility for:
- Large backups and archives
- External drives (USB, HDD, SSD)
- Network transfers (SMB, NFS)
- Large batch deletions

## Compatibility

- Nemo File Manager
- While Nemo is typically used within Linux Mint (Cinnamon DE), this patch only depends on Nemo and can run independently in other compatible environments.
- [**Linux Mint fork here...**](https://github.com/cori77-hub/nemo_progress_dialogue)

## Notes

This patch only modifies the **UI layer of file operations**.
It does not change:
- file transfer logic
- backend I/O implementation
- delete/trash logic or confirmation behavior
