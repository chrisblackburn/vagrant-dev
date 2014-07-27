name "apache-webserver"
description "The base role for systems that serve HTTP traffic"
run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_ssl]",
  "recipe[apache2::mod_headers]"
)
override_attributes(
  "apache" => {
    "listen_ports" => [ "80", "8000", "443" ],
    "group" => "vagrant",
    "version" => "2.4"
  }
)
