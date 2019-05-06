list.of.packages <- c("leaflet", "htmlwidgets")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


# Start Script Here: ------------------------------------------------------

library(leaflet)

my.path = '/Users/mikejohnson/Desktop/W12_test/assignment.csv'

df = read.csv(my.path)

popup = paste0('<a href=', df$url, '> <h1><strong>', df$Name, "</strong></h1></a><br>", df$Des, '<br><br><img src="', df$image, '" height="300px" width="300px"/>')

map = leaflet() %>%
    addTiles( ) %>%
    addMarkers(data = df, lat = df$lat, lng = df$lon, popup = popup )

map

htmlwidgets::saveWidget(map, file = paste0(dirname(my.path), "/map.html"))

