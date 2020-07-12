#' Add JavaScript
#'
#' @description
#' Fetches JavaScript file with its path.
#'
#' @param filename - the desired JS file
#'
#' @examples
#'
#' \dontRun{
#'
#' }
#'
#' @returns The JS file
#'
#' @keywords internal
#'
addJS__ <- function(filename) system.file(
    paste0('js/', filename,'.js'),
    package = 'shinyPWA'
)

#' Create Service Worker
#'
#' @description
#' Generates the required 'serviceWroker.js'
#'
#' @param websiteVersion - The current verion
#'
#' @examples
#'
#' \dontRun{
#'
#' }
#'
#' @returns Whehter or not the operation has been successful completed
#'
#' @importFrom shiny includeScript
#'
#' @keywords internal
#'
createServiceWorker__ <- function(websiteVersion) {
    includeScript(addJS__('serviceWorker'), websiteVersion)
    includeScript(addJS__('app'))
}
