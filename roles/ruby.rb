name "ruby"
description "Environment for running Ruby webapps"
run_list(
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rbenv::vagrant]",
  "recipe[apache2::mod_rewrite]",
  "recipe[apache2::mod_proxy]",
  "recipe[apache2::mod_proxy_http]",
  "recipe[apache2::mod_proxy_balancer]"
)
override_attributes(
  "rbenv" => {
    "rubies" => [
      "1.9.3-p194",
      "1.9.2-p290"
    ],
    "gems" => {
      "1.9.3-p194" => [{
        "name" => "bundler"
      }],
      "1.9.2-p290" => [{
        "name" => "bundler"
      }]
    }
  }
)
