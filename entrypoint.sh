#!/bin/bash
for PACKAGE in $PYTHONPACKAGES; do
pip install $PACKAGE
done
cp -v /lcd4linux.conf /etc/lcd4linux.conf
chown -v root:root /etc/lcd4linux.conf
chmod -v 0600 /etc/lcd4linux.conf
cp -v /get_measuring_value.py /usr/lib/python2.7/site-packages/get_measuring_value.py
chown -v root:root /usr/lib/python2.7/site-packages/get_measuring_value.py 
exec "$@"
