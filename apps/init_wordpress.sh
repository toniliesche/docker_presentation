#!/bin/bash

sudo rm -Rf wordpress
git clone https://github.com/WordPress/WordPress.git wordpress
git -C wordpress checkout 6.0.2
