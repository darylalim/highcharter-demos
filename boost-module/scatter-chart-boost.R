# Scatter chart with boost module ----------------------------------------------
# URL: (https://www.highcharts.com/samples/highcharts/boost/scatter) -----------

# Load packages ----------------------------------------------------------------
library(magrittr)
library(highcharter)

# Define function to get data --------------------------------------------------
get_data <- function(n) {
  data <- list()
  for (i in 0:(n-1)) {
    data[[i+1]] <- c(
      runif(1)^2 * 100,
      runif(1)^2 * 100
    )
  }
  return(data)
}

# Get data ---------------------------------------------------------------------
df <- get_data(n = 100000)

# Display chart ----------------------------------------------------------------
highchart() %>% 
  hc_chart(
    zoomType = "xy",
    height = "100%"
  ) %>% 
  hc_boost(
    enabled = TRUE,
    useGPUTranslations = TRUE,
    usePreAllocated = TRUE
  ) %>% 
  hc_xAxis(
    min = 0,
    max = 100,
    gridLineWidth = 1
  ) %>% 
  hc_yAxis(
    # Renders faster when min and max don't need to be computed
    min = 0,
    max = 100,
    minPadding = 0,
    maxPadding = 0,
    title = list(
      text = FALSE
    )
  ) %>% 
  hc_title(
    text = "Scatter chart with 1000000 points"
  ) %>% 
  hc_legend(
    enabled = FALSE
  ) %>% 
  hc_add_series(
    type = "scatter",
    color = "rgb(152, 0, 67)",
    fillOpacity = 0.1,
    data = df,
    marker = list(
      radius = 1
    ),
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