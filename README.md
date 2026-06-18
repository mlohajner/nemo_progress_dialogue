# Nemo Transfer Speed Graph Patch

This patch modifies Nemo file manager to add a real-time transfer speed / bandwidth graph during file operations (copy/move).

It extends the default progress dialog by adding live visualization of transfer speed over time, similar to functionality found in:
Dolphin file manager (KDE)
Windows File Explorer

By default, Nemo shows only:
progress percentage
estimated time remaining
file count

This patch adds:
real-time transfer speed (kB/s, MB/s)
bandwidth graph over time (from start of operation)
live performance visualization

FEATURES
Real-time transfer speed monitoring
Live bandwidth graph (time-based)
Automatic scaling of graph values
Works for copy and move operations
Minimal performance overhead
Optional debug output (if enabled)

MOTIVATION
Standard file operation UI does not show transfer behavior in detail.

This patch improves visibility for:
large file transfers (backups, ISOs, archives)
external drives (USB, HDD, SSD)
network transfers (SMB/NFS)

Instead of only showing progress %, this patch exposes actual throughput changes during the operation.

COMPATIBILITY
Target: Nemo file manager (Cinnamon desktop environment)

NOTE
This patch only extends the UI layer for file operations.
It does not modify core file transfer logic.
