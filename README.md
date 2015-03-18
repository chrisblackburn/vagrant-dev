Made Vagrant
============

Out of the box, this will use a pre-built vagrant development box, running Ubuntu 14.04, which has already been provision with Chef.

Installation
============
 1. Download [VirtualBox](https://www.virtualbox.org/)
 2. Download [Vagrant](http://www.vagrantup.com/)
 3. Clone the git repistory: `git clone https://github.com/madebymade/vagrant-dev.git`
 4. Start Vagrant: `vagrant up`

What's in the box?
==================
 * Apache 2.4
 * MySQL 5.5
 * Ruby 1.9.2, 1.9.3
 * rbenv
 * Python 2.7 (virtualenv and pip)
 * PHP 5.5
 * PHP Composer
 * phpMyAdmin
 * ImageMagick
 * memcached
 * Git
 * SVN
 * phantomjs


Common commands
===============
Some common things you might like to do:


Symlink your vhost file
-----------------------
Load your configuration in to Apache:

 `sudo ln -s /var/www/<your-project>/config/httpd.conf /etc/apache2/sites-available/<your-project>.conf`


Restart Apache
--------------
Force Apache to pick up the configuration changes:

 `sudo /etc/init.d/apache2 restart`

Building a new version of the box

Building the base box
=====================

There are some additonal dependencies needed if you want to build a new version of the base box.

 1. Install librarian: `sudo gem install librarian`
 2. Install librarian-chef: `sudo gem install librarian-chef`
 3. Run librarian to download the required cookbooks: `librarian-chef install`
 4. In the `Vagrantfile` swap `build_box` to `true`
 5. Start Vagrant: `vagrant up`
 6. If it doesn't do it automatically, provision the machine using Chef: `vagrant provision`
