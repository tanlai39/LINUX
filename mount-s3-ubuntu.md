## 1. Cài s3fs-fuse trên Ubuntu
```
sudo apt update
sudo apt install -y s3fs
```
## 2. Tạo file chứa Access Key & Secret Key
```
echo WASABI_ACCESS_KEY:WASABI_SECRET_KEY | sudo tee /etc/passwd-s3fs > /dev/null
sudo chmod 600 /etc/passwd-s3fs
```
## 3. Tạo thư mục để mount
```
sudo mkdir -p /mnt/wasabi
```
## 4. Lệnh mount S3 (ví dụ Wasabi)
```
sudo s3fs tpc-veeam-backup /mnt/wasabi \
  -o url=https://s3.ap-southeast-1.wasabisys.com \
  -o use_path_request_style \
  -o passwd_file=/etc/passwd-s3fs \
  -o allow_other \
  -o nonempty
```

```
Giải thích nhanh các option quan trọng:
tpc-veeam-backup: tên bucket.
/mnt/wasabi: nơi mount trên Ubuntu.
url=...: endpoint S3 phụ thuộc region.
use_path_request_style: cần cho đa số S3-compatible (Wasabi, MinIO…).
passwd_file=/etc/passwd-s3fs: file chứa key.
allow_other: cho phép user khác đọc (nếu cần).
nonempty: cho phép mount lên thư mục không rỗng.
```

## 5. Tự động mount khi reboot (fstab)
```
vi /etc/fstab
```

```
s3fs#repo-veeam /mnt/wasabi fuse _netdev,allow_other,nonempty,use_path_request_style,url=https://s3.ap-southeast-1.wasabisys.com,passwd_file=/etc/passwd-s3fs 0 0
```

```
sudo umount /mnt/wasabi 2>/dev/null
sudo mount -a
```
## 6. Kiểm Tra
```
root@DNS:~# df -hT
Filesystem     Type       Size  Used Avail Use% Mounted on
tmpfs          tmpfs      195M  1.2M  194M   1% /run
/dev/sda1      ext4        19G  3.0G   16G  17% /
tmpfs          tmpfs      973M     0  973M   0% /dev/shm
tmpfs          tmpfs      5.0M     0  5.0M   0% /run/lock
/dev/sda16     ext4       881M  113M  707M  14% /boot
/dev/sda15     vfat       105M  6.2M   99M   6% /boot/efi
s3fs           fuse.s3fs  4.0G     0  4.0G   0% /mnt/wasabi
tmpfs          tmpfs      195M   12K  195M   1% /run/user/1000
root@DNS:~#
```

