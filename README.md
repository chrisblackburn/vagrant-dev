Made Vagrant
============

Vagrant will give you a virtualised development environment running Ubuntu 14.04 that supports the technologies we employ.

The VM is provisioned via Chef to ensure dependencies are kept up to date across out development estate.


Installation
============
 1. Download [VirtualBox](https://www.virtualbox.org/)
 2. Install vagrant: `sudo gem install vagrant`
 3. Install librarian: `sudo gem install librarian`
 4. Install librarian-chef: `sudo gem install librarian-chef`
 5. Clone the git repistory: `git clone https://github.com/madebymade/vagrant-dev.git`
 6. Run librarian to download the required cookbooks: `librarian-chef install`
 7. Boot the Vagrant VM: `vagrant up`


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
