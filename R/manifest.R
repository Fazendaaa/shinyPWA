#' Create Manifest JSON
#'
#' @description
#' Creates the 'manifest.json' file
#'
#' @examples
#'
#' \dontrun{
#'
#' }
#'
#' @inheritParams shinyPWA__
#'
#' @importFrom jsonlite toJSON
#'
#' @keywords internal
#'
createManifestJSON__ <- function(config) toJSON(list(
    name = config[['name']],
    short_name = config[['shortname']],
    start_url = 'index.html',
    display = config[['display']],
    backgroundcolor = config[['backgroundcolor']],
    themecolor = config[['themecolor']],
    orientation = config[['orientation']],
    icons = if (config[['hasIcons']]) createIconsRefs__() else c()
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
#' \dontrun{
#'
#' }
#'
#' @returns Whether or not the operation has been successful
#'
#' @importFrom shiny tags
#'
#' @keywords internal
#'
createManifest__ <- function(config) {
    createManifestJSON__(config)
    tags[['head']](tags[['head']](rel='manifest', type='manifest.json'))
}
