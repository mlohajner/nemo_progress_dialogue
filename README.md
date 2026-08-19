<h1> <img src="nemo.png" width="64" valign="middle" alt="Nemo icon"> Nemo Transfer Speed Graph V4 </h1>

Instead of only showing *progress %,* users can now see **how fast the operation is actually performing and how it changes over time** — live, not averaged.

Enhanced Nemo Progress Dialog:
- Progress bar
- Real-time speed indicator
- Bandwidth history graph

- Delete operations get their own inverted accent color -distinguishable from a transfer at a glance

| Nemo Transfer Progress | Nemo Delete Progress |
|:-:|:-:|
| ![Nemo Transfer](1%29%20motivation%20%26%20screenshots/less.png) | ![Nemo Delete](1%29%20motivation%20%26%20screenshots/delete2.png) |
![Nemo Transfer](1%29%20motivation%20%26%20screenshots/more.png) | ![Nemo Delete](1%29%20motivation%20%26%20screenshots/delete3.png) |

## Overview

A UI enhancement patch for **Nemo file manager** that adds a real-time **transfer speed / bandwidth graph** during file operations (copy, move, delete).

It upgrades the default progress dialog with live throughput visualization, similar to:
- Dolphin file manager (KDE)
- Windows File Explorer

This patch enhances it by adding a **real-time bandwidth graph**, making operation performance visible over time.

## Features

- Real-time transfer and delete speed monitoring (MB/s, KB/s, B/s, files/s)
- Live bandwidth graph over time
  Actual transfer rate - the graph reacts immediately to speed changes (USB, network shares)
- Automatic graph scaling based on throughput
- Delete operations use distinct or inverted accent color, giving an instant visual cue that the operation is destructive
- Works for copy, move and delete operations
- More / Less option to show and hide graph with GSettings scheme persistance
- Extended GSettings scheme for persistance and customisation
  Transfer color, delete color, graph line thickness, and graph fill opacity.
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
