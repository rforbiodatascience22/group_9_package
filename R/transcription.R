#' This function transcript a DNA sequence into an mRNA sequence
#'
#' @param dna_seq should be a DNA sequence as the input of the function
#'
#' @return The function returns the mRNA sequence
#' @export
#'
#' @examples
#' mRNA <- transcription("TCGGA")
#'
#'@importFrom magrittr %>%
#'
transcription <- function(dna_seq){
  # Substitute "T" with "U"
  mRNA_seq <- gsub("T", "U", dna_seq)
  return(mRNA_seq)
}
