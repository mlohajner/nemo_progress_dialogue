# Patch

## How to apply

1. Get a pristine Nemo 6.4.5 source tree:
   ```
   git clone --branch 6.4.5 https://github.com/linuxmint/nemo.git
   ```
2. Apply the patch from the root of that tree:
   ```
   cd nemo
   patch -p1 < /path/to/nemo-transfer-graph.patch
   ```
   or, if you prefer git:
   ```
   git apply /path/to/nemo-transfer-graph.patch
   ```
3. Install the GSettings schema (needed for graph preference persistence):
   ```
   sudo cp org.nemo.transfer-graph.gschema.xml /usr/share/glib-2.0/schemas/
   sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
   ```
4. Build Nemo as usual, e.g.:
   ```
   meson setup build
   ninja -C build
   sudo ninja -C build install
   ```

A convenience script, `apply-patch.sh`, wraps steps 2–3 for you:
```
./apply-patch.sh /path/to/nemo-6.4.5
```

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
To use GSettings sheme -persistence and additional custimisations, compile and install: `org.nemo.transfer-graph.gschema.xml`**
```
sudo cp org.nemo.transfer-graph.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```

[**Linux Mint fork here...**](https://github.com/cori77-hub/nemo_progress_dialogue)
