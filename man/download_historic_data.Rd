% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ems_sqlite.R
\name{download_historic_data}
\alias{download_historic_data}
\title{Download and store the large historic ems dataset}
\usage{
download_historic_data(
  force = FALSE,
  ask = TRUE,
  dont_update = FALSE,
  n = 1e+06,
  httr_config = list()
)
}
\arguments{
\item{force}{Force downloading the dataset, even if it's not out of date (default \code{FALSE})}

\item{ask}{should the function ask for your permission to cache data on your computer?
Default \code{TRUE}}

\item{dont_update}{should the function avoid updating the data even if there is a newer
version available? Default \code{FALSE}}

\item{n}{Number of records to be written at a time to the
sqlite database. Default is \code{1e6} (one million). Try
lowering this if your computer runs out of memory while
creating the database.}

\item{httr_config}{configuration settings passed on to \code{\link[httr:GET]{httr::GET()}},
such as \code{\link[httr:timeout]{httr::timeout()}}}
}
\value{
The path where the sqlite database is stored (invisibly).
}
\description{
Download and store the large historic ems dataset
}
