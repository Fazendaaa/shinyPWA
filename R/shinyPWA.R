#' Shiny PWA - input validator
#'
#' @description
#' Checks whether or not the input provided trought the user is a correct one.
#'
#' @param config - a list containing:
#'
#' \itemize{    
#'     \item name
#'     \item shortname
#'     \item display
#'     \item backgroundcolor
#'     \item themecolor
#'     \item orientation
#'     \item hasIcons
#'     \item version
#' }
#'
#' @examples
#'
#' \dontrun{
#'
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
        warn('config must be a list')

        return FALSE
    }
    if (FALSE == is.string(config[['name']])) {
        warn('config[[\'name\']] must be a string')

        return FALSE
    }
    if (FALSE == is.string(config[['shortname']])) {
        warn('config[[\'shortname\']] must be a string')

        return FALSE
    }
    if (FALSE == is.string(config[['backgroundcolor']])) {
        warn('config[[\'background\']] must be a string')

        return FALSE
    }
    if (FALSE == is.string(config[['themecolor']])) {
        warn('config[[\'themecolor\']] must be a string')

        return FALSE
    }
    if (FALSE == is.string(config[['orientation']])) {
        warn('config[[\'orientation\']] must be a string')

        return FALSE
    }
    if (FALSE == is.boolean(config[['hasIcons']])) {
        warn('config[[\'orientation\']] must be a boolean')

        return FALSE
    }
    if (FALSE == is.string(config[['verion']])) {
        warn('config[[\'version\']] must be a string')

        return FALSE
    }

    return TRUE
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
#'
#' }
#'
#' @returns Whether or the operation has been successful completed
#'
#' @export
#'
shinyPWA <- function(config) {
    if (FALSE == shinyPWA__(config)) {
        stop('Invalid input')        
    }

    createManifest__(config)
    createServiceWorker__(config[['version']])
}
