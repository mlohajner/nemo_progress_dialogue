# Patch

This directory is intended to contain the Nemo bandwidth graph patch.

The patch is not currently available, as different Linux distributions ship slightly different versions of Nemo.

The main challenge is supporting multiple distribution-specific variants and sub-versions of Nemo, which is not a priority at this time.

If there is sufficient interest, a future version of the patch may be developed to extend Nemo's file transfer dialog with real-time bandwidth visualization across multiple distributions.

## Related source files

Until then, you can explore the relevant changes in the following source files:
- src/nemo-progress-info-widget.c
- src/nemo-progress-info-widget.h
- libnemo-private/nemo-file-operations.c
- libnemo-private/nemo-progress-info.c
- libnemo-private/nemo-progress-info.h
- libnemo-private/org.nemo.transfer-graph.gschema.xml
- libnemo-private/meson.build

## Alternative

If you are a Fedora user with Nemo installed, you may consider using the provided prebuilt binary instead of compiling from source.  
**NOTE:  
To use GSettings sheme -persistence of settings and additional custimisations, compile and install: `org.nemo.transfer-graph.gschema.xml`**
```
sudo cp org.nemo.transfer-graph.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```

[**Linux Mint fork here...**](https://github.com/cori77-hub/nemo_progress_dialogue)
