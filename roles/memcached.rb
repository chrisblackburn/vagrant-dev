name "memcached"
description "Memory caching daemon with a single bin"
run_list(
  "recipe[memcached]",
)
default_attributes(
  "memcached" => { 
    "memory" => "64M",
  }
)
