#' Visualization of the number of each unique amino acid
#'
#' @param AA_seq This is the translated amino acid sequence
#' @return The function returns the bar plot
#' @export
#'@importFrom magrittr %>%
#' @examples
#' AAplot <- AA_num_plot("IPTAAKNN")
#'
AA_num_plot <- function(AA_seq){
  # Split the AA sequence and find the unique ones
  unique_AA <- AA_seq %>%
    stringr::str_split(pattern = stringr::boundary("character"), simplify = TRUE) %>%
    as.character() %>%
    unique()

  # Count each unique AA and make data frame
  counts <- sapply(unique_AA,
                   function(amino_acid) stringr::str_count(string = AA_seq, pattern =  amino_acid)) %>%
    as.data.frame()

  # Rename columns
  colnames(counts) <- c("Counts")
  counts[["AA_name"]] <- rownames(counts)

  # Produce bar plot
  AAplot <- counts %>%
    ggplot2::ggplot(ggplot2::aes(x = AA_name, y = Counts, fill = AA_name)) +
    ggplot2::geom_col() +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.position = "none")

  return(AAplot)
}
