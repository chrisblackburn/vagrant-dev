build_box = false

if build_box
  unless Vagrant.has_plugin?('vagrant-omnibus')
    raise 'vagrant-omnibus is not installed! Install with `vagrant plugin install vagrant-omnibus`'
  end
end

Vagrant.configure(2) do |config|
  if build_box
    config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
    config.vm.box = 'trusty64'
  else
    config.vm.box_url = 'https://s3-eu-west-1.amazonaws.com/madetech-vagrant/made-dev-trusty64.box'
    config.vm.box = 'made-dev-trusty64'
  end

  config.vm.hostname = 'made-trusty'

  config.vm.network 'forwarded_port', guest: 80, host: 8000
  config.vm.network 'forwarded_port', guest: 443, host: 4430
  config.vm.network 'forwarded_port', guest: 5000, host: 5000
  config.vm.network 'forwarded_port', guest: 5001, host: 5001

  config.vm.network 'private_network', ip: '192.168.0.100'

  synced_folder_path = ENV['SYNCED_FOLDER_PATH'] || 'www'
  synced_folder_type = ENV['SYNCED_FOLDER_TYPE'] || 'nfs'
  
  config.vm.synced_folder synced_folder_path, '/var/www/', type: synced_folder_type

  cpus = ENV['VAGRANT_CPUS'] || '2'

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', '2048']
    v.customize ['modifyvm', :id, '--cpus', cpus]
    v.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  if build_box
    config.omnibus.chef_version = '11.8.2'

    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
      chef.roles_path = ['roles']

      chef.add_recipe 'apt'
      chef.add_recipe 'apt::update_cache'
      chef.add_recipe 'apt::packages'

      chef.add_role 'apache-webserver'
      chef.add_role 'mysql'
      chef.add_role 'php'
      chef.add_role 'ruby'
      chef.add_role 'python'
      chef.add_role 'source-control'
      chef.add_role 'development'
      chef.add_role 'imagemagick'
      chef.add_role 'test'

      chef.json = {
        :phpmyadmin => {
          :hostname => 'phpmyadmin.local'
        }
      }
    end
  end
end
