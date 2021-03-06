#' List all CourseKata course packages
#'
#' @param check_remote_version Should the remote version number be checked? Requires internet, and
#'   will take longer.
#'
#' @return A data frame with three variables: the name of the package \code{package}, the
#'   \code{version}, and whether it is currently \code{attached}.
#' @export
#'
#' @examples
#' coursekata_packages()
coursekata_packages <- function(check_remote_version = FALSE) {
  pkgs <- c(
    'supernova', 'mosaic', 'lsr',
    'fivethirtyeight', 'fivethirtyeightdata', 'Lock5withR', 'okcupiddata', 'dslabs'
  )

  info <- data.frame(
    package = pkgs,
    installed = pkg_is_installed(pkgs),
    attached = pkg_is_attached(pkgs),
    version = pkg_version(pkgs),
    stringsAsFactors = FALSE
  )

  if (check_remote_version) {
    info$remote_version <- pkg_remote_version(pkgs)
    info$behind <- info$version < info$remote_version
  }

  info
}


#' List all currently attached CourseKata course packages
#'
#' @return A character vector of the course packages that have been attached.
#' @keywords internal
coursekata_attached <- function() {
  info <- coursekata_packages()
  info$package[info$attached]
}


#' List all currently NOT attached CourseKata course packages
#'
#' @return A character vector of the course packages that are not attached.
#' @keywords internal
coursekata_detached <- function() {
  info <- coursekata_packages()
  info$package[!info$attached]
}
