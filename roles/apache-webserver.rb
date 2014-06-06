name "apache-webserver"
description "The base role for systems that serve HTTP traffic"
run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_ssl]"
)
default_attributes(
  "apache2" => {
    "listen_ports" => [ "80", "443" ],
    "group" => "vagrant"
  }
)
override_attributes(
  "apache" => {
    "version" => "2.4"
  }
)