Vagrant::Config.run do |config|
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box = "trusty64"

  config.vm.forward_port 80, 8000
  config.vm.forward_port 443, 4430
  config.vm.forward_port 5000, 5000
  config.vm.forward_port 5001, 5001

  config.vm.network :hostonly, "192.168.0.134"

  config.vm.share_folder "docs", "/home/vagrant/docs/", "/Users/chrisblackburn/Documents/"
  config.vm.share_folder "www", "/var/www/", "www", :nfs => true
  #config.vm.customize ["modifyvm", :id, "--memory", 2048]

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = ["roles"]

    chef.add_recipe "apt"
    chef.add_recipe "apt::update_cache"

    chef.add_role "apache-webserver"
    chef.add_role "mysql"
    chef.add_role "php"
    chef.add_role "ruby"
    chef.add_role "python"
    chef.add_role "source-control"
    chef.add_role "development"
    chef.add_role "imagemagick"
    chef.add_role "test"

    chef.json = {
      :phpmyadmin => {
        :hostname => 'phpmyadmin.local'
      }
    }
  end
end
