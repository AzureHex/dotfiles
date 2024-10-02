```sh
sudo nano /etc/mkinitcpio.conf
```

```sh
MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```
```sh
sudo nano /etc/modprobe.d/nvidia.conf
```

```sh
options nvidia_drm modeset=1 fbdev=1
```
```sh
sudo mkinitcpio -P
```