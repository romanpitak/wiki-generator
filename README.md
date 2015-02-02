# WMS - Wiki My Sources

Not yet fully functional :)

Generates GitHub wiki from your source code comments.

## Installation

```sh
./configure
make
sudo make install
make clean
```

## Usage

```sh
cd my/git/repo
wms
ll wiki
```

#### Optional

Configure options:

```sh
./configure --help
    --binName=wms
    --prefix=/usr/local
    --binDir=${prefix}/bin
    --libDir=${prefix}/lib/${binName}
    --whichBash=/bin/bash
    --whichSed=/bin/sed
    --whichAwk=/usr/bin/awk
```

## Uninstall

```sh
./configure # with the correct --prefix
sudo make uninstall
```
