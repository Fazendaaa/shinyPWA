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
#' \dontRun{
#'
#' }
#'
#' @returns Whether or not the input is valid
#'
#' @keywords internal
#'
shinyPWA__ <- function() {

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
#' \dontRun{
#'
#' }
#'
#' @returns Whether or the operation has been successful completed
#'
#' @export
#'
shinyPWA <- function() {
    if (FALSE == shinyPWA__()) {
        stop('Invalid input')        
    }

    createManifest__()
    createServiceWorker__(version)
}
