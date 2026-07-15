# Patch

This directory is intended to contain the Nemo bandwidth graph patch.

The patch is not currently available, as different Linux distributions ship slightly different versions of Nemo.

The main challenge is supporting multiple distribution-specific variants and sub-versions of Nemo, which is not a priority at this time.

If there is sufficient interest, a future version of the patch may be developed to extend Nemo's file transfer dialog with real-time bandwidth visualization across multiple distributions.

[**Linux Mint users checkout the fork here...**](https://github.com/cori77-hub/nemo_progress_dialogue)

## Related source files

Until then, you can explore the relevant changes in the following source files:
- src/nemo-progress-info-widget.c
- src/nemo-progress-info-widget.h

- libnemo-private/nemo-file-operations.c
- libnemo-private/nemo-progress-info.c
- libnemo-private/nemo-progress-info.h

## Alternative

If you are a Fedora user with Nemo installed, you may consider using the provided prebuilt binary instead of compiling from source.
