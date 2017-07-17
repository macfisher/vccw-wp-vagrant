# VCCW

[![Build Status](https://travis-ci.org/vccw-team/vccw.svg?branch=master)](https://travis-ci.org/vccw-team/vccw)

This is a Vagrant configuration designed for development of WordPress plugins, themes, or websites.

To get started, check out <http://vccw.cc/>

## Configuration

1. Copy `provision/default.yml` to `site.yml`.
1. Edit the `site.yml`.
1. Run `vagrant up`.

### Note

* The `site.yml` has to be in the same directory with Vagrantfile.
* You can put difference to the `site.yml`.


<pre>
/** The following information taken from http://vccw.cc/ */
What's Installed

    Ubuntu 16.04 Xenial64
        Subversion
        Git
        jq
    WP-CLI & WordPress
        WP-CLI
        WordPress i18n Tools
        WordPress Coding Standards for PHP_CodeSniffer
    PHP 7
        PHPUnit
        Composer
        PHP_CodeSniffer
    MySQL 5.7.x
    Apache 2.4.x
    NodeJS latest
    Ruby 2.3
        Bundler
        Wordmove
        MailCatcher

Requires

    Vagrant 1.8.6 or later
    VirtualBox 5.1.6 or later


# Windows does not allow to change hosts files. Please add vccw.dev 192.168.33.10 by yourself!
Must open C:\Windows\System32\drivers\etc\hosts with Notepad (ran as Administrator)

## VCCW (Vagrant WordPress Dev VM)
192.168.33.10   vccw.dev



Environments
WordPress

This tool installs a WordPress environment with these settings by default.

    Default user
        Username: admin
        Password: admin

MySQL

    MySQL Host: 127.0.0.1
    Username: wordpress or root
    Password: wordpress
    Port: 3306

SSH

    Host: vccw.dev or 192.168.33.10
    Username: vagrant
    Password: vagrant
    Port: 22

You can login virtual machine with vagrant ssh



Customizing

VCCW is configured for those developing WordPress plugins, themes or websites. It includes many customizable variables for setting the WordPress version (or beta release), language, hostname, subdirectory, admin credentials, default plugins, default theme, multisite, SSL and other options. These variables give you a lot of flexibility in tailoring your development environment to your specific needs.

Copy provision/default.yml to site.yml like following.

$ cp provision/default.yml site.yml

Then edit the site.yml and run vagrant up.

Or place the site.yml and put variables like following.

hostname: example.com
ip: 192.168.33.11
lang: ja
plugins:
  - contact-form-7
  - jetpack
theme: twentysixteen

Then just run vagrant up.
Global configuration

VCCW has a series of global parameters which work with all virtual machines.

They can be specified ~/.vccw/config.yml like following.

memory: 1024
cpus: 2
lang: ja
theme_unit_test: true

Customizable variables

See provision/default.yml.



Run pre/post provisioning scripts

You can place shell scripts, so it will run at pre/post provisioning.

    provision-pre.sh - Run before chef provisioning.
    provision-post.sh - Run after chef provisioning.

Example shell script.

provision-post.sh - It will run after provisioning.

#!/usr/bin/env bash

set -ex

/usr/local/bin/wp --path=/var/www/wordpress plugin install contact-form-7 --activate

This example script will install and activate plugin "Contact Form 7" by WP-CLI.
Customize with Ansible

Also, you can use Ansible.

provision-post.yml - It will run after provisioning.

- hosts: all
  become: yes

  tasks:

  - name: Ensure nginx is installed
    apt: pkg=nginx state=latest





Checking Email with MailCatcher

MailCathcer re-routes all WordPress emails to Mailcatcher.

Please visit: http://vccw.dev:1080/






WP-CLI

We developed a community command that generates a VCCW environment.

https://github.com/vccw-team/scaffold-vccw
How to install

$ wp package install vccw/scaffold-vccw:@stable

How to use

Generate a VCCW environment into the wp.dev directory.

$ wp scaffold vccw wp.dev
Generating:   100% [===========================] 0:03 / 0:06
Success: Generated.
$ cd wp.dev
$ vagrant up

Usage

$ wp help scaffold vccw
NAME

  wp scaffold vccw

DESCRIPTION

  Generate a new VCCW environment.

SYNOPSIS

  wp scaffold vccw <directory> [--host=<hostname>] [--ip=<ip-address>]
  [--lang=<language>]

OPTIONS

  <directory>
    The directory of the new VCCW based guest machine.

  [--host=<hostname>]
    Hostname of the guest machine. Default is `vccw.dev`.

  [--ip=<ip-address>]
    IP address of the guest machine. Default is `192.168.33.10`.

  [--lang=<language>]
    Language of the WordPress. Default is `en_US`.

EXAMPLES

    $ wp scaffold vccw wordpress.dev
    Generating:   100% [===========================] 0:03 / 0:06
    Success: Generated.

    $ wp scaffold vccw wordpress.dev --lang=ja
    Generating:   100% [===========================] 0:03 / 0:06
    Success: Generated.
</pre>
