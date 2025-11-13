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
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# fdisk /dev/sdb

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x653176b2.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-220200959, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-220200959, default 220200959):

Created a new partition 1 of type 'Linux' and of size 105 GiB.

Command (m for help): t
Selected partition 1
Hex code or alias (type L to list all): 8e
Changed type of partition 'Linux' to 'Linux LVM'.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
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
└─sdb1                      8:17   0  105G  0 part
sr0                        11:0    1 1024M  0 rom
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# mkfs.ext4 /dev/sdb1
mke2fs 1.46.5 (30-Dec-2021)
Discarding device blocks: done
Creating filesystem with 27524864 4k blocks and 6881280 inodes
Filesystem UUID: 07608dce-e3d6-469d-9f85-2b035cab1af1
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872

Allocating group tables: done
Writing inode tables: done
Creating journal (131072 blocks): done
Writing superblocks and filesystem accounting information: done

root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# mount -a
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# ll /
total 3968088
drwxr-xr-x  22 root root       4096 Nov 12 11:00 ./
drwxr-xr-x  22 root root       4096 Nov 12 11:00 ../
lrwxrwxrwx   1 root root          7 Sep 11  2024 bin -> usr/bin/
drwxr-xr-x   5 root root       4096 Nov 12 10:09 boot/
dr-xr-xr-x   2 root root       4096 Sep 11  2024 cdrom/
drwxr-xr-x  19 root root       4080 Nov 12 13:55 dev/
drwxr-xr-x  96 root root       4096 Nov 12 11:32 etc/
drwxr-xr-x   3 root root       4096 Nov 12 10:13 home/
lrwxrwxrwx   1 root root          7 Sep 11  2024 lib -> usr/lib/
lrwxrwxrwx   1 root root          9 Sep 11  2024 lib32 -> usr/lib32/
lrwxrwxrwx   1 root root          9 Sep 11  2024 lib64 -> usr/lib64/
lrwxrwxrwx   1 root root         10 Sep 11  2024 libx32 -> usr/libx32/
drwx------   2 root root      16384 Nov 12 10:06 lost+found/
drwxr-xr-x   2 root root       4096 Sep 11  2024 media/
drwxr-xr-x   3 root root       4096 Nov 12 11:00 .minio/
drwxr-xr-x   3 root root       4096 Nov 12 13:55 minio-data/
drwxr-xr-x   2 root root       4096 Sep 11  2024 mnt/
drwxr-xr-x   2 root root       4096 Sep 11  2024 opt/
dr-xr-xr-x 247 root root          0 Nov 12 11:53 proc/
drwx------   4 root root       4096 Nov 12 11:32 root/
drwxr-xr-x  30 root root        860 Nov 12 13:22 run/
lrwxrwxrwx   1 root root          8 Sep 11  2024 sbin -> usr/sbin/
drwxr-xr-x   6 root root       4096 Sep 11  2024 snap/
drwxr-xr-x   2 root root       4096 Sep 11  2024 srv/
-rw-------   1 root root 4063232000 Nov 12 10:08 swap.img
dr-xr-xr-x  13 root root          0 Nov 12 11:53 sys/
drwxrwxrwt  13 root root       4096 Nov 12 13:41 tmp/
drwxr-xr-x  14 root root       4096 Sep 11  2024 usr/
drwxr-xr-x  13 root root       4096 Sep 11  2024 var/
root@ubuntu:~# chown minio-user:minio-user /minio-data
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# ll /
total 3968088
drwxr-xr-x  22 root       root             4096 Nov 12 11:00 ./
drwxr-xr-x  22 root       root             4096 Nov 12 11:00 ../
lrwxrwxrwx   1 root       root                7 Sep 11  2024 bin -> usr/bin/
drwxr-xr-x   5 root       root             4096 Nov 12 10:09 boot/
dr-xr-xr-x   2 root       root             4096 Sep 11  2024 cdrom/
drwxr-xr-x  19 root       root             4080 Nov 12 13:55 dev/
drwxr-xr-x  96 root       root             4096 Nov 12 11:32 etc/
drwxr-xr-x   3 root       root             4096 Nov 12 10:13 home/
lrwxrwxrwx   1 root       root                7 Sep 11  2024 lib -> usr/lib/
lrwxrwxrwx   1 root       root                9 Sep 11  2024 lib32 -> usr/lib32/
lrwxrwxrwx   1 root       root                9 Sep 11  2024 lib64 -> usr/lib64/
lrwxrwxrwx   1 root       root               10 Sep 11  2024 libx32 -> usr/libx32/
drwx------   2 root       root            16384 Nov 12 10:06 lost+found/
drwxr-xr-x   2 root       root             4096 Sep 11  2024 media/
drwxr-xr-x   3 root       root             4096 Nov 12 11:00 .minio/
drwxr-xr-x   3 minio-user minio-user       4096 Nov 12 13:55 minio-data/
drwxr-xr-x   2 root       root             4096 Sep 11  2024 mnt/
drwxr-xr-x   2 root       root             4096 Sep 11  2024 opt/
dr-xr-xr-x 247 root       root                0 Nov 12 11:53 proc/
drwx------   4 root       root             4096 Nov 12 11:32 root/
drwxr-xr-x  30 root       root              860 Nov 12 13:22 run/
lrwxrwxrwx   1 root       root                8 Sep 11  2024 sbin -> usr/sbin/
drwxr-xr-x   6 root       root             4096 Sep 11  2024 snap/
drwxr-xr-x   2 root       root             4096 Sep 11  2024 srv/
-rw-------   1 root       root       4063232000 Nov 12 10:08 swap.img
dr-xr-xr-x  13 root       root                0 Nov 12 11:53 sys/
drwxrwxrwt  13 root       root             4096 Nov 12 13:41 tmp/
drwxr-xr-x  14 root       root             4096 Sep 11  2024 usr/
drwxr-xr-x  13 root       root             4096 Sep 11  2024 var/
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~#
root@ubuntu:~# df -hT
Filesystem                        Type   Size  Used Avail Use% Mounted on
tmpfs                             tmpfs  388M  1.4M  387M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv ext4    27G  6.9G   19G  28% /
tmpfs                             tmpfs  1.9G     0  1.9G   0% /dev/shm
tmpfs                             tmpfs  5.0M     0  5.0M   0% /run/lock
/dev/sda2                         ext4   2.0G  132M  1.7G   8% /boot
/dev/sda1                         vfat   1.1G  6.1M  1.1G   1% /boot/efi
tmpfs                             tmpfs  388M  4.0K  388M   1% /run/user/1000
/dev/sdb1                         ext4   103G   60K   98G   1% /minio-data
