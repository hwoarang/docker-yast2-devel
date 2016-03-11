#!/bin/bash

grep -q ${USER} /etc/passwd ||useradd -m ${USER} -s /bin/bash -G wheel 1>&2

exec /bin/bash
