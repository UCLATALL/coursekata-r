% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-pkg.R
\name{pkg_library_location}
\alias{pkg_library_location}
\title{Determine which libraries packages were loaded from}
\usage{
pkg_library_location(pkgs)
}
\arguments{
\item{pkgs}{A character vector of packages to check.}
}
\value{
A character vector of library directory paths the packages were loaded from, the default
location if the package is not loaded but is installed, or NA if the package is not installed.
}
\description{
Determine which libraries packages were loaded from
}
\keyword{internal}
