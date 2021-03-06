#' @title Import Dfam Query Output
#' @description Import the output file generated with \code{\link{dfam.query}}.
#' @param dfam.file path to Dfam output file generated with \code{\link{dfam.query}}.
#' @author Hajk-Georg Drost
#' @examples 
#' # import example Dfam output
#' dfam.file <- read.dfam(system.file("example_dfam.out", package = "LTRpred"))
#' 
#' head(dfam.file)
#' @export

read.dfam <- function(dfam.file){

    if (!file.exists(dfam.file))
        stop ("The file '",dfam.file,"' does not exist! Please check the correct path to the dfam.file.", call. = FALSE)
    
    # read dfam query output
    annoFile <- readr::read_lines(dfam.file)
    
    # remove header lines from dfam query output
    annoFile <-
        annoFile[-which(sapply(annoFile, function(x)
            stringr::str_detect(x, "\\#")))]
    
    
    if (length(annoFile) > 0) {
        # parse dfam query output to data.frame
        annoFile.processed <-
            as.data.frame(do.call(rbind, lapply(annoFile, function(x) {
                rem <- unlist(stringr::str_split(x, " "))
                rem <- rem[-which(rem == "")]
                word <- stringr::str_c(rem[15:length(rem)], collapse = " ")
                rem <- rem[-c(15:length(rem))]
                rem <- c(rem, word)
                #res.list <- as.list(rem)
                return (rem)
                
            })))
        
        # name columns
        colnames(annoFile.processed) <-
            c(
                "target_name",
                "acc",
                "query_name",
                "bits",
                "e_value",
                "bias",
                "hmm-st",
                "hmm-en",
                "strand",
                "ali-st",
                "ali-en",
                "env-st",
                "env-en",
                "modlen",
                "target_description"
            )
        
        # reformat data types
        annoFile.processed[, "bits"] <-
            as.numeric(as.vector(annoFile.processed[, "bits"]))
        annoFile.processed[, "e_value"] <-
            as.numeric(as.vector(annoFile.processed[, "e_value"]))
        annoFile.processed[, "bias"] <-
            as.numeric(as.vector(annoFile.processed[, "bias"]))
        annoFile.processed[, "hmm-st"] <-
            as.numeric(as.vector(annoFile.processed[, "hmm-st"]))
        annoFile.processed[, "hmm-en"] <-
            as.numeric(as.vector(annoFile.processed[, "hmm-en"]))
        annoFile.processed[, "ali-st"] <-
            as.numeric(as.vector(annoFile.processed[, "ali-st"]))
        annoFile.processed[, "ali-en"] <-
            as.numeric(as.vector(annoFile.processed[, "ali-en"]))
        annoFile.processed[, "env-st"] <-
            as.numeric(as.vector(annoFile.processed[, "env-st"]))
        annoFile.processed[, "env-en"] <-
            as.numeric(as.vector(annoFile.processed[, "env-en"]))
        annoFile.processed[, "modlen"] <-
            as.numeric(as.vector(annoFile.processed[, "modlen"]))
        
        return (annoFile.processed)
    } else {
        warning("The file '",dfam.file,"' did not contain any entries! It therefore has not been imported!")
        return (NULL)
    }
    
}


