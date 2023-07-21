# Series-heavy stock chart with boost module -----------------------------------
# URL: (https://www.highcharts.com/samples/highcharts/boost/line-series-heavy-stock)

# Load packages ----------------------------------------------------------------
library(magrittr)
library(lubridate)
library(highcharter)

# Define point start and point interval ----------------------------------------
point_start <- ymd("2017-01-01") %>% 
  as.numeric() * 1000
point_interval <- 24 * 36e5

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
      spike <- 0
    } else {
      spike <- 0
    }
    arr[[i+1]] <- c(point_start + i * point_interval, 2 * sin(i / 100) + a + b + c + spike + runif(1))
  }
  return(arr)
}

# Define function to get series ------------------------------------------------
get_series <- function(n, s) {
  i <- 0
  r <- list()
  while (i < s) {
    r[[i+1]] <- list(
      data = get_data(n),
      dataGrouping = list(
        enabled = FALSE
      ),
      lineWidth = 2,
      boostThreshold = 1,
      turboThreshold = 1,
      showInNavigator = TRUE
    )
    i <- i + 1
  }
  return(r)
}

# Get series -------------------------------------------------------------------
n <- 120
s <- 600
series <- get_series(n, s)

# Highcharts Version 11 default color palette ----------------------------------
colors_v11 <- c(
  "#2caffe", "#544fc5", "#00e272", "#fe6a35", "#6b8abc", 
  "#d568fb", "#2ee0ca", "#fa4b42", "#feb56a", "#91e8e1"
)

# Display chart ----------------------------------------------------------------
highchart(type = "stock") %>% 
  hc_chart(
    type = "line",
    zoomType = "x"
  ) %>%
  hc_colors(colors = colors_v11) %>% 
  hc_boost(
    enabled = TRUE,
    useGPUTranslations = TRUE
  ) %>% 
  hc_title(
    text = "Highcharts drawing 72000 points across 600 series"
  ) %>% 
  hc_subtitle(
    text = "Using the Boost module"
  ) %>% 
  hc_legend(
    enabled = FALSE
  ) %>% 
  hc_xAxis(
    min = point_start,
    max = point_start + n * point_interval,
    ordinal = FALSE
  ) %>% 
  hc_yAxis(
    min = 0,
    max = 8
  ) %>% 
  hc_navigator(
    xAxis = list(
      ordinal = FALSE,
      min = point_start,
      max = point_start + n * point_interval
    ),
    yAxis = list(
      min = 0,
      max = 10
    ),
    series = list(
      color = NULL # Inherit from base
    )
  ) %>% 
  hc_scrollbar(
    liveRedraw = FALSE
  ) %>% 
  hc_tooltip(
    valueDecimals = 2,
    split = FALSE
  ) %>% 
  hc_add_series_list(
    x = series
  ) %>% 
  hc_credits(
    enabled = TRUE
  ) %>% 
  hc_exporting(
    enabled = TRUE
  )