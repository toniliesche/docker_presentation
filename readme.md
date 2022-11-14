# Docker & K8s Demonstration Repository

This repository contains several configuration files needed for my Docker & K8s workshop / presentation. To get started, clone it to ~/phpughh/docker.

`mkdir ~/phpughh`

`git clone https://github.com/toniliesche/docker_presentation.git ~/phpughh/docker`

`git clone https://github.com/WordPress/WordPress.git ~/phpughh/docker/`

`git clone https://github.com/WordPress/WordPress.git ~/phpughh/wordpress`

`git -C ~/phpughh/wordpress fetch --tags`

`git -C ~/phpughh/wordpress checkout 6.0.3`

`cp -Rf ~/phpughh/wordpress ~/phpughh/docker/images/wordpress-php/build/`
