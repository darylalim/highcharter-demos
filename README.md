# Highcharter Demos

This repository contains demonstrations of the [`highcharter`](https://jkunst.com/highcharter/) package for R.

`highcharter` is a wrapper for the [Highcharts](https://www.highcharts.com/) JavaScript library.

## Overview

The demos are [Quarto](https://quarto.org/) documents showcasing charts created with various methods:

-   `highchartzero()`. This function creates a Highchart chart using [htmlwidgets](https://www.htmlwidgets.org/). The accessibility module can be added as a dependency with this chart.
-   `hcmap()`. This creates a map from [Highmaps - Map Collection](https://code.highcharts.com/mapdata/).
-   `highchart(type = "stock")`. This function creates a Highchart stock chart using [htmlwidgets](https://www.htmlwidgets.org/).

Each demo shows a data visualization using one of the methods above. The general pattern is to:

1.  Load the necessary R packages.

2.  Build, import, or read data.

3.  Set accessibility options using options() for the chart.

4.  Set the Highcharts version 11 color palette.

5.  Visualize the chart.

## How to Use the Demos

### Organization

The demos are organized in Quarto Documents.

The repository is organized into folders for each of the Highcharts libraries:

-   `highcharts-core` contains demos of the [Highcharts Core](https://www.highcharts.com/products/highcharts) library
-   `highcharts-maps` contains demos of the [Highcharts Maps](https://www.highcharts.com/products/maps) library
-   `highcharts-stock` contains demos of the [Highcharts Stock](https://www.highcharts.com/products/stock) library
-   `highcharts-gantt` contains demos of the [Highcharts Gantt](https://www.highcharts.com/products/gantt) library

In each folder, there are sub-folders grouping demos by category. For example:

-   `highcharts-core/line-charts` folder contains Quarto Documents that demonstrate line chart functionality.
-   `highcharts-core/line-charts/data-raw` folder contains R scripts for downloading data files.
-   `highcharts-core/line-charts/data` folder contains downloaded data files.

The Boost module is an advanced chart feature for rendering large amounts of data points and series:

-   `boost-module` folder contains demos of the [Boost module](https://www.highcharts.com/docs/advanced-chart-features/boost-module) with R scripts.

### Using the Demos Locally

To use the demos locally, you can follow these steps:

1.  Clone this GitHub repo:

``` zsh
$ git clone https://github.com/darylalim/highcharter-demos.git
```

2.  Open in RStudio:

-   File \> Open Project.
-   Navigate to the directory downloaded above.
-   Double-click `highcharter-demos.Rproj` to open the project.

In the "Files" tab, you should see a set of Quarto Documents included in the repository, along with data files and R scripts.

To see how `highcharter` generates a basic line chart, you can open the Quarto Document at `highcharts-core/line-charts/basic-line.qmd`.

Run the Quarto Document to see the chart.
