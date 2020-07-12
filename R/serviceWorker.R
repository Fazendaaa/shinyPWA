#' Add JavaScript
#'
#' @description
#' Fetches JavaScript file with its path.
#'
#' @param filename - the desired JS file
#'
#' @examples
#'
#' \dontrun{
#'     addJS__('app')
#'     addJS__('serviceWorker')
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
#' \dontrun{
#      createServiceWorker__('v1')
#      createServiceWorker__('v2')
#      createServiceWorker__('v2.2')
#' }
#'
#' @returns Whehter or not the operation has been successful completed
#'
#' @importFrom shiny includeScript
#'
#' @keywords internal
#'
createServiceWorker__ <- function(websiteVersion) list(
    app = includeScript(addJS__('app')),
    serviceWorker = includeScript(addJS__('serviceWorker'), websiteVersion)
)
