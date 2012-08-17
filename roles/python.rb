name "python"
description "Environment for running Python webapps"
run_list(
  "recipe[python]",
  "recipe[apache2::mod_rewrite]",
  "recipe[apache2::mod_proxy]",
  "recipe[apache2::mod_proxy_http]",
  "recipe[apache2::mod_proxy_balancer]"
)
override_attributes(
  "python" => {
    "version" => "2.7.1"
  }
)
