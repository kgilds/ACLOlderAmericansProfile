tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
print(tiger)

tiger_png <- image_convert(tiger, "png")
image_info(tiger_png)

library(here)
library(magick)

thumbnail <- magick::image_read(here::here("inst", "app", "www", "map.png")) %>%
  image_scale(396) %>%
  image_scale("x240") %>%
  image_write(here::here("inst", "app", "www", "map_thumbnail.png"))

image_info(thumbnail)