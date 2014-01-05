#' source all the R files in a specific directory
#' caoyang
#' 12/30/2013
#' 
#' @param path, character, in which files to source, default workspace
#' @param verbose, logical, whether show the file name
#' @param \dots, arg  arguments passed down from \code{dir}.
#' 
#' @example
#' sourceDir()

sourceDir <- function(path=".", verbose=T, ...){
    files <- dir(path, pattern=".[Rr]", ...)
    for (file in files){
        if (verbose)
            cat(file, "\n")
        source(file)
    }
    cat("done...\n")
}