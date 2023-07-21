# Column chart with boost module -----------------------------------------------
# URL: (https://highcharts.com/samples/highcharts/boost/column) ----------------

# Load packages ----------------------------------------------------------------
library(magrittr)
library(highcharter)

# Define function to get data --------------------------------------------------
get_data <- function(n) {
  arr <- c()
  for (i in 0:(n-1)) {
    if (i %% 100 == 0) {
      a <- 2 * runif(1)
    }
    if (i %% 1000 == 0) {
      b <- 2 * runif(1)
    }
    if (i %% 10000 == 0) {
      c <- 2 * runif(1)
    }
    if (i %% 50000 == 0) {
      spike <- 10
    } else {
      spike <- 0
    }
    arr[[i+1]] <- c(i, 2 * sin(i / 100) + a + b + c + spike + runif(1))
  }
  return(arr)
}

# Get data ---------------------------------------------------------------------
df <- get_data(n = 500000)

# Highcharts Version 11 default color palette ----------------------------------
colors_v11 <- c(
  "#2caffe", "#544fc5", "#00e272", "#fe6a35", "#6b8abc", 
  "#d568fb", "#2ee0ca", "#fa4b42", "#feb56a", "#91e8e1"
)

# Display chart ----------------------------------------------------------------
highchart() %>% 
  hc_chart(
    type = "column",
    zoomType = "x",
    panning = TRUE,
    panKey = "shift"
  ) %>% 
  hc_colors(colors = colors_v11) %>% 
  hc_boost(
    enabled = TRUE,
    useGPUTranslations = TRUE
  ) %>% 
  hc_title(
    text = "Highcharts drawing 500000 points"
  ) %>% 
  hc_subtitle(
    text = "Using the Boost module"
  ) %>% 
  hc_tooltip(
    valueDecimals = 2
  ) %>% 
  hc_add_series(
    data = df
  ) %>% 
  hc_credits(
    enabled = TRUE
  ) %>% 
  hc_exporting(
    enabled = TRUE
  )