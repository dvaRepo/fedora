#!/bin/bash
for i in `cat packages.txt` ; do sudo dnf -y install $i; done
