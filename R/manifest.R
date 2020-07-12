#' Create Manifest JSON
#'
#' @description
#' Creates the 'manifest.json' file
#'
#' @examples
#'
#' \dontRun{
#'
#' }
#'
#' @inheritParams shinyPWA__
#'
#' @importFrom jsonlite toJSON
#'
#' @keywords internal
#'
createManifestJSON__ <- function(name, shortname, starturl, display) toJSON(list(
    name = name,
    short_name = shortname,
    start_url = 'index.html',
    display = display,
    backgroundcolor = backgroundcolor,
    themecolor = themecolor,
    orientation = orientation,
    icons = if (hasIcons) createIconsRefs__() else c()
))

#' Create Manifest
#'
#' @description
#' Generates the required 'manifest.json'
#'
#' @inheritParams createManifestJSON__
#'
#' @example
#'
#' \dontRun{
#'
#' }
#'
#' @returns Whether or not the operation has been successful
#'
#' @importFrom shiny tags
#'
#' @keywords internal
#'
createManifest__ <- function() {
    createManifestJSON__()
    tags$head(tags$link(rel='manifest', type='manifest.json'))
}
