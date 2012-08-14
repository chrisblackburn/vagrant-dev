name "test"
description "Role that can be used for testing webapps"
run_list(
  "recipe[phantomjs]",
  "recipe[java]",
  "recipe[jslint4java]",
  "recipe[jscoverage]",
  "recipe[npm]",
  "recipe[npm::csslint]"
)
override_attributes(
  "jslint4java" => {
    "version" => "2.0.2",
    "user" => "vagrant",
    "destination" => "/usr/lib/jslint4java"
  }
)
