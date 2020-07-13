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
#' @importFrom imager load.image height width
#'
#' @keywords internal
#'
inferIconMetadata__ <- function(icon) {
    filename <- tail(unlist(strsplit(icon, '/')), n = 1)
    # I know that this is dumb AF and files don't work this way, but 99% of the
    # cases this will work just fine
    format <- tail(unlist(strsplit(filename, '\\.')), n = 1)
    image <- load.image(icon)

    return (list(
        src = icon,
        type = paste0('image/', format),
        sizes = paste0(height(image), 'x', width(image))
    ))
}

#' Fetch Icons
#'
#' @description
#' Looks for files in the 'www/icons/' folder.
#'
#' @param icons - the icon folder
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
fetchIcons__ <- function(icons) {
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
createIconsRefs__ <- function() {
    icons <- './www/icons/'

    return (Map(function (icon) {
        return (inferIconMetadata__(paste0(icons, icon)))
    }, fetchIcons__(icons)))
}
