name "webserver"
description "PHP scripting language"
run_list(
  "recipe[php]",
  "recipe[apache2::mod_php5]",
  "recipe[php::module_curl]",
  "recipe[composer]"
)
override_attributes(
  "php" => {
    "version" => "5.5.13"
  }
)
