name "mysql"
description "MySQL database service"
run_list(
  "recipe[mysql::client]",
  "recipe[mysql::server]"
)
default_attributes(
  "mysql"  => { 
    "bind_address" => "127.0.0.1" 
  }
)
override_attributes(
  "mysql" => { 
    "server_root_password" => "root", 
    "server_repl_password" => "root",
    "server_debian_password" => "root"
  }
)
