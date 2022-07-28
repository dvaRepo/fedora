#!/bin/bash
for i in `cat packages.txt` ; do dnf -y install $i; done
