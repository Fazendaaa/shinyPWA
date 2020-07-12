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
        warning('config must be a list')

        return (FALSE)
    }
    if (FALSE == is.string(config[['name']])) {
        warning('config[[\'name\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['shortname']])) {
        warning('config[[\'shortname\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['backgroundcolor']])) {
        warning('config[[\'background\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['themecolor']])) {
        warning('config[[\'themecolor\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.string(config[['orientation']])) {
        warning('config[[\'orientation\']] must be a string')

        return (FALSE)
    }
    if (FALSE == is.logical(config[['hasIcons']])) {
        warning('config[[\'hasIcons\']] must be a logical')

        return (FALSE)
    }
    if (FALSE == is.string(config[['version']])) {
        warning('config[[\'version\']] must be a string')

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
#' @importFrom shiny tagList
#'
#' @export
#'
shinyPWA <- function(config) {
    if (FALSE == shinyPWA__(config)) {
        stop('Invalid input')        
    }

    return (tagList(addAppVersion__(config[['version']]),
                    createManifest__(config),
                    createServiceWorker__()))
}
