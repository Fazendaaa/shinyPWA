#' Create Manifest JSON
#'
#' @description
#' Creates the 'manifest.json' file
#'
#' @examples
#'
#' \dontrun{
#'     createManifestJSON__(list(
#'         name = 'testing',
#'         shorname = 'test',
#'         display = 'standalone',
#'         backgroundcolor = '#fdfdfd',
#'         themecolor = '#db4938',
#'         orientation = 'portrait-primary'
#'     ))
#' }
#'
#' @inheritParams shinyPWA__
#'
#' @importFrom jsonlite toJSON unbox
#'
#' @keywords internal
#'
createManifestJSON__ <- function(config) {
    manifest <- data.frame(
        start_url = c('index.html'),
        name = c(config[['name']]),
        short_name = c(config[['shortname']]),
        display = c(config[['display']]),
        background_color = c(config[['backgroundcolor']]),
        theme_color = c(config[['themecolor']]),
        orientation = c(config[['orientation']])
    )

    if (config[['hasIcons']]) {
        manifest[["icons"]] <- createIconsRefs__()
    }

    return (toJSON(unbox(manifest)))
}

#' Create Manifest
#'
#' @description
#' Generates the required 'manifest.json'
#'
#' @inheritParams createManifestJSON__
#'
#' @examples
#'
#' \dontrun{
#'     createManifest(list(
#'         name = 'testing',
#'         shorname = 'test',
#'         display = 'standalone',
#'         backgroundcolor = '#fdfdfd',
#'         themecolor = '#db4938',
#'         orientation = 'portrait-primary'
#'     ))
#' }
#'
#' @returns The needed 'manifest.json' to be placed in the HMTL head
#'
#' @importFrom shiny tags
#'
#' @keywords internal
#'
createManifest__ <- function(config) {
    basePath <- paste0(getwd(), '/www/')

    if (FALSE == dir.exists(basePath)) {
        dir.create(basePath)
    }

    write(createManifestJSON__(config),
          file = paste0(basePath, 'manifest.json'))
    
    return (tags[['head']](tags[['head']](rel='manifest',
                                          type='manifest.json')))
}
