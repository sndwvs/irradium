mesa options
============

Infos copied from various places*, built against current CRUX 3.7

*:
- [meson.build · main · Mesa / mesa · GitLab](https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads)
- [meson_options.txt · main · Mesa / mesa · GitLab](https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson_options.txt?ref_type=heads)
- [BLFS: Mesa-23.1.8](https://www.linuxfromscratch.org/blfs/view/svn/x/mesa.html)
- [File Mesa.spec of Package Mesa - openSUSE Build Service](https://build.opensuse.org/package/view_file/openSUSE:Factory/Mesa/Mesa.spec?expand=1)

## directx-headers

```
=======> New files found:
NEW       -rwxr-xr-x      root/root       usr/lib/dri/d3d12_dri.so
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## glslang

glslang (for vulkan drivers)

```
=======> New files found:
NEW       drwxr-xr-x      root/root       usr/bin/                                                                                                                                          
NEW       -r-xr-xr-x      root/root       usr/bin/mesa-overlay-control.py                                                                                                                   
NEW       -rwxr-xr-x      root/root       usr/lib/libVkLayer_MESA_overlay.so                                                                                                                
NEW       -rwxr-xr-x      root/root       usr/lib/libvulkan_intel.so                                                                                                                        
NEW       -rwxr-xr-x      root/root       usr/lib/libvulkan_radeon.so                                                                                                                       
NEW       -rw-r--r--      root/root       usr/share/drirc.d/00-radv-defaults.conf
NEW       -rw-r--r--      root/root       usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
NEW       -rw-r--r--      root/root       usr/share/vulkan/icd.d/intel_icd.x86_64.json
NEW       -rw-r--r--      root/root       usr/share/vulkan/icd.d/radeon_icd.x86_64.json
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## libclc spirv-llvm-translator

```
=======> New files found:
NEW       drwxr-xr-x      root/root       etc/
NEW       drwxr-xr-x      root/root       etc/OpenCL/
NEW       drwxr-xr-x      root/root       etc/OpenCL/vendors/
NEW       -rw-r--r--      root/root       etc/OpenCL/vendors/mesa.icd
NEW       drwxr-xr-x      root/root       usr/lib/gallium-pipe/
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_crocus.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_i915.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_iris.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_nouveau.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_r300.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_r600.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_radeonsi.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_swrast.so
NEW       -rwxr-xr-x      root/root       usr/lib/gallium-pipe/pipe_vmwgfx.so
NEW       lrwxrwxrwx      root/root       usr/lib/libMesaOpenCL.so -> libMesaOpenCL.so.1
NEW       lrwxrwxrwx      root/root       usr/lib/libMesaOpenCL.so.1 -> libMesaOpenCL.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/libMesaOpenCL.so.1.0.0
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## libclc rust-bindgen spirv-llvm-translator

```
=======> New files found:
NEW       drwxr-xr-x      root/root       etc/
NEW       drwxr-xr-x      root/root       etc/OpenCL/
NEW       drwxr-xr-x      root/root       etc/OpenCL/vendors/
NEW       -rw-r--r--      root/root       etc/OpenCL/vendors/rusticl.icd
NEW       lrwxrwxrwx      root/root       usr/lib/libRusticlOpenCL.so -> libRusticlOpenCL.so.1
NEW       lrwxrwxrwx      root/root       usr/lib/libRusticlOpenCL.so.1 -> libRusticlOpenCL.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/libRusticlOpenCL.so.1.0.0
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## libunwind

[unchanged]

## libva

Install libva before building mesa to get hardware acceleration for the
following drivers:

> libva-2.19.0 (to provide VA-API support for some gallium drivers, note that
> there is a circular dependency. You must build libva first without EGL and
> GLX support, install this package, and rebuild libva)
[BLFS: Mesa-23.1.8](https://www.linuxfromscratch.org/blfs/view/svn/x/mesa.html)

```
=======> New files found:
NEW       -rwxr-xr-x      root/root       usr/lib/dri/nouveau_drv_video.so
NEW       -rwxr-xr-x      root/root       usr/lib/dri/r600_drv_video.so
NEW       -rwxr-xr-x      root/root       usr/lib/dri/radeonsi_drv_video.so
NEW       -rwxr-xr-x      root/root       usr/lib/dri/virtio_gpu_drv_video.so
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## libvdpau

libvdpau-1.5 (to build VDPAU drivers)

```
=======> New files found:
NEW       drwxr-xr-x      root/root       usr/lib/vdpau/
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_nouveau.so -> libvdpau_nouveau.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_nouveau.so.1 -> libvdpau_nouveau.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_nouveau.so.1.0 -> libvdpau_nouveau.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/vdpau/libvdpau_nouveau.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_r600.so -> libvdpau_r600.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_r600.so.1 -> libvdpau_r600.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_r600.so.1.0 -> libvdpau_r600.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/vdpau/libvdpau_r600.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_radeonsi.so -> libvdpau_radeonsi.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_radeonsi.so.1 -> libvdpau_radeonsi.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_radeonsi.so.1.0 -> libvdpau_radeonsi.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/vdpau/libvdpau_radeonsi.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_virtio_gpu.so -> libvdpau_virtio_gpu.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_virtio_gpu.so.1 -> libvdpau_virtio_gpu.so.1.0.0
NEW       lrwxrwxrwx      root/root       usr/lib/vdpau/libvdpau_virtio_gpu.so.1.0 -> libvdpau_virtio_gpu.so.1.0.0
NEW       -rwxr-xr-x      root/root       usr/lib/vdpau/libvdpau_virtio_gpu.so.1.0.0
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## lm_sensors

[unchanged]

## vulkan-loader

```
=======> New files found:
NEW       -rwxr-xr-x      root/root       usr/lib/dri/zink_dri.so
=======> Building '/home/pkgmk/packages/mesa#23.2.1-1.pkg.tar.xz' succeeded.
```

## wayland-protocols

[unchanged]
