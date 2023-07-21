# Bubble chart with boost module -----------------------------------------------
# URL: (https://highcharts.com/samples/highcharts/boost/bubble) ----------------

# Load packages ----------------------------------------------------------------
library(magrittr)
library(highcharter)

# Define function to get data --------------------------------------------------
get_data <- function(n) {
  data <- list()
  for (i in 0:(n-1)) {
    data[[i+1]] <- c(
      runif(1)^2 * 100,
      runif(1)^2 * 100,
      runif(1)^2 * 100
    )
  }
  return(data)
}

# Get data ---------------------------------------------------------------------
df <- get_data(n = 50000)

# Highcharts Version 11 default color palette ----------------------------------
colors_v11 <- c(
  "#2caffe", "#544fc5", "#00e272", "#fe6a35", "#6b8abc", 
  "#d568fb", "#2ee0ca", "#fa4b42", "#feb56a", "#91e8e1"
)

# Display chart ----------------------------------------------------------------
highchart() %>% 
  hc_chart(
    zoomType = "xy"
  ) %>% 
  hc_colors(colors = colors_v11) %>% 
  hc_boost(
    enabled = TRUE,
    useGPUTranslations = TRUE,
    usePreallocated = TRUE
  ) %>% 
  hc_xAxis(
    gridLineWidth = 1,
    minPadding = 0,
    maxPadding = 0,
    startOnTick = FALSE,
    endOnTick = FALSE
  ) %>% 
  hc_yAxis(
    minPadding = 0,
    maxPadding = 0,
    startOnTick = FALSE,
    endOnTick = FALSE
  ) %>% 
  hc_title(
    text = "Bubble chart with 50000 points"
  ) %>% 
  hc_legend(
    enabled = FALSE
  ) %>% 
  hc_add_series(
    type = "bubble",
    boostBlending = "alpha",
    color = "rgb(152, 0, 67)",
    fillOpacity = 0.1,
    data = df,
    minSize = 1,
    maxSize = 10,
    tooltip = list(
      followPointer = FALSE,
      pointFormat = "[{point.x:.1f}, {point.y:.1f}]"
    )
  ) %>% 
  hc_credits(
    enabled = TRUE
  ) %>% 
  hc_exporting(
    enabled = TRUE
  )