#!/bin/bash
useradd $1
echo $2 | passwd --stdin $1
