name "test"
description "Role that can be used for testing webapps"
run_list(
  "recipe[phantomjs]",
  "recipe[jscoverage]"
)
override_attributes(
  "phantomjs" => {
    "version" => "1.9.1"
  }
)
