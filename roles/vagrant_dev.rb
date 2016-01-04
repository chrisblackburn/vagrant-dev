name 'vagrant_dev'

description 'Role used for local vagrant development setup'

run_list(
  'recipe[apt]',
  'recipe[apt::update_cache]',
  'recipe[apt::packages]',
  'role[apache-webserver]',
  'role[mysql]',
  'role[redis]',
  'role[php]',
  'role[ruby]',
  'role[python]',
  'role[source-control]',
  'role[development]',
  'role[imagemagick]',
  'role[test]',
  'role[chef]'
)

override_attributes(
  'phpmyadmin' => {
    'hostname' => 'phpmyadmin.local'
  }
)
