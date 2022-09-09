# Openstack-Tools
Just openstack bash script tool

## Install

1. Clone this repos

`git clone https://github.com/leonyonz/Openstack-Tools.git`

2. Install to system

`cd Openstack-Tools; ./inisiate.sh`

3. Tools already instaled!

## How to use

1. Select AdminRC, for example region JKT:

```
source jkt-admin.rc
```

2. Run tools:

**tempelproject**: tools yang digunakan untuk menambahkan project user ke akun admin.

```
$ tempelproject

Input Project ID Customer : <Project ID>
```

**lepasproject**: tools yang digunakan untuk melepas project user dari akun admin.

```
$ lepasproject

Input Project ID Customer : <Project ID>
```

**switchproject**: tools yang digunakan untuk menukar project user A dengan user B.

```
$ switchproject

Masukkan Akun Email Asal : <email user A>
Masukkan Akun Email Tujuan : <email user B>
```

**batchlepas**: tools yang digunakan utnuk melepas beberapa project user dari akun admin.

```
$ batchlepas

Batch Role Removed Tools
------------------------
Jangan lupa gunakan Admin RC Sesuai Project !

Input Project Name Customer (spasi sebagai pemisah) : <Project Name|cth: #12345>
```