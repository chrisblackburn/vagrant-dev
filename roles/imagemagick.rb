name "imagemagick"
description "Imagemagick development environment"
run_list(
  "recipe[imagemagick]",
  "recipe[imagemagick::devel]"
)
