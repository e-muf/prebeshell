#!/bin/bash

cat /proc/driver/rtc | grep -o -m 1 '[0-9]*-[0-9]*-[0-9]*'