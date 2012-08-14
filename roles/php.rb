name "webserver"
description "PHP scripting language"
run_list(
  "recipe[php]",
  "recipe[apache2::mod_php5]",
  "recipe[phpunit]"
)
override_attributes(
  "php" => { 
    "version" => "5.3.10" 
  }
)
