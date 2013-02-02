Made Vagrant
============

Vagrant will give you a virtualised development environment running Ubuntu 10.04 that supports the technologies we employ.

The VM is provisioned via Chef to ensure dependencies are kept up to date across out development estate.


Installation
============
 1. Download [VirtualBox](https://www.virtualbox.org/)
 2. Install vagrant: `sudo gem install vagrant`
 3. Install librarian: `sudo gem install librarian`
 4. Clone the git repistory: `git clone https://github.com/madebymade/vagrant-dev.git`
 5. Run librarian to download the required cookbooks: `librarian-chef install`
 6. Boot the Vagrant VM: `vagrant up`


What's in the box?
==================
 * Apache 2.2
 * MySQL 5
 * Ruby 1.9.2
 * rbenv
 * Python (virtualenv and pip)
 * PHP 5.2
 * phpUnit
 * phpMyAdmin
 * ImageMagick
 * memcached
 * Git
 * SVN
 * Sphinx
 * jslint4java
 * csslint
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


Run JSLint
----------
You're recommended to run this before pushing any code changes upstream. Jenkins will run this task as part of the build step.

 `java -jar /usr/lib/jslint4java/jslint4java-2.0.2.jar <path-to-your-js-directory>/*.js`


Run CSSLint
-----------
As with JSLint - run before pushing code changes upstream.

 `csslint <path-to-your-css-directory>/*.css`
