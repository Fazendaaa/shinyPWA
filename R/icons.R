#' Infer Icon Metadata
#'
#' @description
#' Infer the incon metadata
#'
#' @param icon - icon filename
#'
#' @examples
#'
#' \dontrun{
#'     inferIconMetadata('/home/usrName/Documents/shiny/www/icons/01.png')
#'     inferIconMetadata('/home/usrName/Documents/shiny/www/icons/02.png')
#'     inferIconMetadata('/home/usrName/Documents/shiny/www/icons/03.png')
#' }
#'
#' @returns the desired metadata
#'
#' @keywords internal
#'
inferIconMetadata__ <- function(icon) {
    return (list(
        src = '',
        type = '',
        sizes = '',
    ))
}

#' Fetch Icons
#'
#' @description
#' Looks for files in the 'www/icons/' folder.
#'
#' @returns the name of all the icons presented in the 'icon' folder
#'
#' @examples
#'
#' \dontrun{
#'     fetchIcons__()
#' }
#'
#' @returns The icons to fetch its metadata
#'
#' @keywords internal
#'
fetchIcons__ <- function() {
    icons <- paste0(getwd(), '/www/icons')

    if (FALSE == dir.exists(icons)) {
        stop(paste0('Folder containing icons could not be found, please set ',
                    'hasIcon to FALSE or create the incons folder and add ',
                    'a few icons to it'))
    }

    return (list.files(icons))
}

#' Create Icons References
#'
#' @description
#' Creates an array containing all the icons to be loaded into the PWA mainifest
#' file.
#'
#' @examples
#'
#' \dontrun{
#'     createIconsRefs__()
#' }
#'
#' @returns An array of containing the icons
#'
#' @keywords internal
#'
createIconsRefs__ <- function() vapply(
    fetchIcons__(),
    inferIconMetadata__,
    list()
)
