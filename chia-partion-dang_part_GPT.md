root@ubuntu:~# lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0 63.9M  1 loop /snap/core20/2318
loop1                       7:1    0   87M  1 loop /snap/lxd/29351
loop2                       7:2    0 38.8M  1 loop /snap/snapd/21759
sda                         8:0    0   30G  0 disk
├─sda1                      8:1    0    1G  0 part /boot/efi
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0 26.9G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0 26.9G  0 lvm  /
sdb                         8:16   0  105G  0 disk
sr0                        11:0    1 1024M  0 rom
