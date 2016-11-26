% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ems_sqlite.R
\name{attach_historic_data}
\alias{attach_historic_data}
\title{Load the historic ems sqlite database as a tbl}
\usage{
attach_historic_data()
}
\value{
A dplyr connection to the sqlite database. See \code{\link[dplyr]{src_sqlite}} for more.
}
\description{
You can then use dplyr verbs such as \code{\link[dplyr]{filter}},
\code{\link[dplyr]{select}}, \code{\link[dplyr]{summarize}}, etc. For basic
importing of historic data based on \code{ems_id}, \code{date}, and \code{parameter},
you can use the function \code{\link{read_historic_data}}
}
\details{
Note that the dates are stored in the sqlite database as integers.
This number is the number of seconds since midnight on January 1, 1970, PST. Convert the dates
to a \code{POSIXct} object with \code{as.POSIXct(x, origin = "1970/01/01", tz = "Etc/GMT+8")}.
If you use \code{\link{read_historic_data}}, this will be done for you.
}
\examples{
\dontrun{
library(dplyr)
foo <- attach_historic_data()
bar <- foo \%>\%
  group_by(EMS_ID) \%>\%
  summarise(max_date = max(COLLECTION_START))
baz <- collect(bar)
baz$max_date <- as.POSIXct(baz$max_date, origin = "1970/01/01", tz = "Etc/GMT+8")
}
}
