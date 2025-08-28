## HƯỚNG DẪN CÀI DNS SERVER

Trên server có add thêm 1 ổ đĩa 200G dev/sdb1 mount đến /data

```
apt -y update && apt -y upgrade
```

```
apt -y install bind9 bind9utils
```

```
vi /etc/bind/named.conf
```

```
// This is the primary configuration file for the BIND DNS server named.
//
// Please read /usr/share/doc/bind9/README.Debian for information on the
// structure of BIND configuration files in Debian, *BEFORE* you customize
// this configuration file.
//
// If you are just adding zones, please do that in /etc/bind/named.conf.local

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
include "/etc/bind/named.conf.internal-zones";

``
