#' download the ref files of a page
#' caoyang
#' 01/05/2014
#' 
#' @param url, A character string naming the URL of a resource of ref files
#' @param pattern, character string containing a regular expression (or 
#' character string for fixed = TRUE) to be matched in the given character 
#' vector. Coerced by as.character to a character string if possible. If a 
#' character vector of length 2 or more is supplied, the first element is used 
#' with a warning
#' @param path, a character string where the download ref files to save, default
#' is your workspace
#' @param \dots, arguments passed from \code{\link{download.file}}
#' 
#' @example
#' 
#' @importFrom XML xmlroot htmlParse xpathApply
#' 
downloadRef <- function(url, pattern, path=getwd(), ...){
  # print the ref files name to be dowanload
  catRef <- function(f){
    function(...){
      cat(basename(..1))
      Sys.sleep(1)
      f(...)
    }
  }
  doc = xmlRoot(htmlParse(url))
  doc.ref = xpathSApply(doc, "//a/@href")
  doc.ref = doc.ref[grepl(pattern=pattern, doc.ref)]
  ref.url = paste0(url, doc.ref)
  dir.create(path, showWarnings = FALSE)s
  dest.file = file.path(path, doc.ref) 
  mapply(catRef(download.file), ref.url,dest.file, ...)
}