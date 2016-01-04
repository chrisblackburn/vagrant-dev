name "redis"
description "redis dependencies"
run_list(
  "recipe[redis::install_from_package]"
)
