#' Get repositories for the packages.
#'
#' Ensures a default CRAN is set if one is not already set, and adds the repository for
#' fivethirtyeightdata.
#'
#' @param repos Optionally set a repository character vector to augment. If one of the values is not
#'   named CRAN, the RStudio CRAN server will be added.
#'
#' @return A set of repositories that can be used to install or update the CourseKata packages.
#' @export
#'
#' @examples
#' coursekata_repos()
coursekata_repos <- function(repos = getOption('repos')) {
  repos <- c(repos, 'https://fivethirtyeightdata.github.io/drat/')
  if (getOption('repos')['CRAN'] == '@CRAN@') {
    repos['CRAN'] = "http://cran.rstudio.com"
  }
  repos
}
