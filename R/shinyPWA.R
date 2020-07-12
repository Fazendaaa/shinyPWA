#' Shiny PWA - input validator
#'
#' @description
#' Checks whether or not the input provided trought the user is a correct one.
#'
#' @param config - a list containing:
#'
#' \itemize{
#'     \item{name}{The app name}
#'     \item{shortname}{The app shortname}
#'     \item{display}{The display value}
#'     \item{backgroundcolor}{The background color}
#'     \item{themecolor}{The theme color}
#'     \item{orientation}{The orientation}
#'     \item{hasIcons}{Whether or not the package has icons to be added}
#'     \item{version}{The peckage version}
#' }
#'
#' @examples
#'
#' \dontrun{
#'     shinyPWA__(list(
#'         name = 'testing',
#'         shorname = 'test',
#'         display = 'standalone',
#'         backgroundcolor = '#fdfdfd',
#'         themecolor = '#db4938',
#'         orientation = 'portrait-primary'
#'     ))
#' }
#'
#' @returns Whether or not the input is valid
#'
#' @importFrom assertthat is.string
#'
#' @keywords internal
#'
shinyPWA__ <- function(config) {
    if (FALSE == is.list(config)) {
        warnning('config must be a list')

        return (FALSE)
    }
    if (FALSE == is.string(config[['name']])) {
        warnning('config[[\'name\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['shortname']])) {
        warnning('config[[\'shortname\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['backgroundcolor']])) {
        warnning('config[[\'background\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['themecolor']])) {
        warnning('config[[\'themecolor\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['orientation']])) {
        warnning('config[[\'orientation\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.logical(config[['hasIcons']])) {
        warnning('config[[\'orientation\']] must be a logical')

        return (FALSE)
    }
    if (FALSE == is.string(config[['version']])) {
        warnning('config[[\'version\']] must be a string')

        return (FALSE)
    }

    return (TRUE)
}

#' Shiny PWA
#'
#' @description
#' Creates the files needed to transform your Shiny application in a Progressive
#' Web App (PWA).
#'
#' @inheritParams shinyPWA__
#'
#' @examples
#'
#' \dontrun{
#'     shinyPWA(list(
#'         name = 'testing',
#'         shorname = 'test',
#'         display = 'standalone',
#'         backgroundcolor = '#fdfdfd',
#'         themecolor = '#db4938',
#'         orientation = 'portrait-primary'
#'     ))
#' }
#'
#' @inherit createManifest__ return
#'
#' @export
#'
shinyPWA <- function(config) {
    if (FALSE == shinyPWA__(config)) {
        stop('Invalid input')        
    }

    createServiceWorker__(config[['version']])
 
    return (createManifest__(config))
}
