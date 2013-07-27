name "test"
description "Role that can be used for testing webapps"
run_list(
  "recipe[phantomjs]",
  "recipe[java]",
  "recipe[jslint4java]",
  "recipe[jscoverage]",
  "recipe[npm]",
  "recipe[npm::csslint]",
  "recipe[npm::jshint]"
)
override_attributes(
  "jslint4java" => {
    "version" => "2.0.2",
    "user" => "vagrant",
    "destination" => "/usr/lib/jslint4java"
  },
  "phantomjs" => {
    "version" => "1.9.1"
  },
  "nodejs" => {
    "version" => "0.10.2"
  }
)
