name "source-control"
description "Useful source control clients"
run_list(
  "recipe[git]",
  "recipe[subversion]"
)
