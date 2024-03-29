#' @title readExcelSheet
#' @description Function reads data from an Excel file from a specified sheet
#' @author Lech Madeyski
#' @export readExcelSheet
#' @param path Path to an Excel file, e.g. /User/lma/datasets/MyDataSet.xls
#' @param sheet Name of a sheet within an Excel file we want to read
#' @param colNames If TRUE, first row of data will be used as column names.
#' @examples
#' myPath <- system.file("extdata", "DataSet.xlsx", package = "reproducer")
#' Madeyski15SQJ.NDC <- readExcelSheet(path = myPath, sheet = "Madeyski15SQJ.NDC", colNames = TRUE)
readExcelSheet <- function(path, sheet, colNames) {
  dataset <- openxlsx::read.xlsx(xlsxFile = path, sheet = sheet, colNames = colNames)
  return(dataset)
}



#' @title densityCurveOnHistogram
#' @description Density curve overlaid on histogram
#' @author Lech Madeyski
#' @export densityCurveOnHistogram
#' @param df Data frame with data to be displayed
#' @param colName Name of the selected column in a given data frame
#' @param limLow the limit on the lower side of the displayed range
#' @param limHigh the limit on the higher side of the displayed range
#' @return A figure being a density curve overlaid on histogram
#' @examples
#' densityCurveOnHistogram(Madeyski15EISEJ.PropProjects, "STUD", 0, 100)
#' # densityCurveOnHistogram(data.frame(x<-rnorm(50, mean=50, sd=5)), 'x', 0, 100)
densityCurveOnHistogram <- function(df, colName, limLow, limHigh) {
  p1 <- ggplot2::ggplot(df, ggplot2::aes_string(x = colName), environment = environment()) +
    ggplot2::xlab("") +
    ggplot2::ggtitle(colName) +
    # The dot-dot notation (`..density..`) was deprecated in ggplot2 3.4.0.
    # Please use `after_stat(density)` instead.
    #ggplot2::geom_histogram(ggplot2::aes_string(y = "..density.."),
    ggplot2::geom_histogram(ggplot2::aes_string(y = "ggplot2::after_stat(density)"),
      fill = "cornsilk", colour = "grey60"
    ) +
    ggplot2::geom_density(fill = "green", alpha = 0.4) +
    ggplot2::xlim(limLow, limHigh)
  return(p1)
}

#' @title boxplotHV
#' @description Box plot
#' @author Lech Madeyski
#' @export boxplotHV
#' @param df Data frame with data to be displayed
#' @param colName Name of the selected column in a given data frame
#' @param limLow the limit on the lower side of the displayed range
#' @param limHigh the limit on the higher side of the displayed range
#' @param isHorizontal Boolean value to control whether the box plot should be horizontal or not (i.e., vertical)
#' @return A box plot
#' @examples
#' boxplotHV(Madeyski15EISEJ.PropProjects, "STUD", 0, 100, TRUE)
#' boxplotHV(Madeyski15EISEJ.PropProjects, "STUD", 0, 100, FALSE)
#' boxplotHV(Madeyski15SQJ.NDC, "simple", 0, 100, FALSE)
#' boxplotHV(Madeyski15SQJ.NDC, "simple", 0, 100, TRUE)
boxplotHV <- function(df, colName, limLow, limHigh, isHorizontal) {
  p2 <- ggplot2::ggplot(df, ggplot2::aes_string(x = 1, y = colName)) +
    ggplot2::ylab("") +
    ggplot2::ggtitle(colName) +
    ggplot2::geom_boxplot(fill = "orange") +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(
      limLow,
      limHigh
    ) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(limLow, limHigh) +
    ggplot2::theme_bw() +
    ggplot2::ylim(
      limLow,
      limHigh
    ) +
    # The `fun.y` argument of `stat_summary()` is deprecated as of ggplot2 3.3.0.
    # Please use the `fun` argument instead.
    # ggplot2::stat_summary(fun.y = "mean", geom = "point", shape = 23, fill = "white") +
    ggplot2::stat_summary(fun = "mean", geom = "point", shape = 23, fill = "white") +
    ggplot2::scale_x_continuous(breaks = NULL)

  if (isHorizontal) {
    p2 <- p2 + ggplot2::coord_flip()
  }
  return(p2)
}

#' @title boxplotAndDensityCurveOnHistogram
#' @description Boxplot and density curve overlaid on histogram
#' @author Lech Madeyski
#' @export boxplotAndDensityCurveOnHistogram
#' @param df Data frame with data to be displayed
#' @param colName Name of the selected column in a given data frame
#' @param limLow the limit on the lower side of the displayed range
#' @param limHigh the limit on the higher side of the displayed range
#' @return A figure being a density curve overlaid on histogram
#' @examples
#' library(ggplot2)
#' library(grid)
#' library(gridExtra)
#' boxplotAndDensityCurveOnHistogram(Madeyski15EISEJ.PropProjects, "STUD", 0, 100)
#' boxplotAndDensityCurveOnHistogram(Madeyski15SQJ.NDC, "simple", 0, 100)
boxplotAndDensityCurveOnHistogram <- function(df, colName, limLow, limHigh) {
  if (!"package:ggplot2" %in% search()) {
    suppressPackageStartupMessages(attachNamespace("ggplot2"))
    on.exit(detach("package:ggplot2"))
  }

  p1 <- densityCurveOnHistogram(df, colName, limLow, limHigh)
  p2 <- boxplotHV(df, colName, limLow, limHigh, TRUE)

  # arrange the plots together, with appropriate height and width for each row and column
  p1 <- p1 + ggplot2::labs(axis.title.x = ggplot2::element_blank(), text = ggplot2::element_text(), x = ggplot2::element_blank())

  p1 <- p1 + ggplot2::theme(axis.text.y = ggplot2::element_text(size = 12), axis.title = ggplot2::element_text(size = 12), axis.text = ggplot2::element_text(size = 12)) +
    ggplot2::scale_y_continuous(labels = fmt())

  p2 <- p2 + ggplot2::xlab("") + ggplot2::ylab("") + ggplot2::theme(axis.title = ggplot2::element_text(size = 12), axis.text = ggplot2::element_text(size = 12))
  p2 <- p2 + ggplot2::theme(title = ggplot2::element_blank()) + ggplot2::ylim(limLow, limHigh) + ggplot2::scale_x_continuous(
    limits = c(0.5, 1.5),
    breaks = c(1), labels = c("Box plot")
  )

  gridExtra::grid.arrange(p1, p2, nrow = 2, heights = c(4, 1))
}


#' @title printXTable
#' @description print data table using xtable R package
#' @author Lech Madeyski
#' @export printXTable
#' @param data Data structure including columns to be printed.
#' @param selectedColumns Columns selected to be printed.
#' @param tableType Type of table to produce. Possible values are 'latex' or 'html'. Default value is 'latex'.
#' @param alignCells Defines how to align data cells.
#' @param digits Defines the number of decimal points in each column.
#' @param caption Caption of the table.
#' @param label Label of the table.
#' @param fontSize Size of the font used to produce a table.
#' @param captionPlacement The caption will be have placed at the bottom of the table if captionPlacement is 'bottom' and at the top of the table if it equals 'top'. Default value is 'bottom'.
#' @param alignHeader Defines how to align column headers of a table.
#' @return A table generated on the fly on a basis of passed data (data, selectedColumns etc.).
#' @examples
#' d <- reproducer::MadeyskiKitchenham.MetaAnalysis.PBRvsCBRorAR
#' printXTable(d, "Study", "latex", "cc", 0, "C", "L", "tiny", "top", "l")
printXTable <- function(data, selectedColumns, tableType = "latex", alignCells, digits, caption, label, fontSize, captionPlacement = "bottom", alignHeader) {
  df <- as.data.frame(unclass(data), optional = TRUE)
  #sourcedata.xtable <- xtable::xtable(df[eval(parse(text = selectedColumns))], digits = digits, caption = caption, label = label)
  sourcedata.xtable <- xtable::xtable(df[eval(expr=selectedColumns)], digits = digits, caption = caption, label = label) #fixed error in 0.5.0
  if (exists("alignHeader")) {
    names(sourcedata.xtable) <- alignHeader
  }
  #xtable::align(sourcedata.xtable) <- eval(parse(text = alignCells)) #fixed error in 0.5.0
  xtable::align(sourcedata.xtable) <- eval(expr=alignCells)
  print(sourcedata.xtable,
    booktabs = TRUE, NA.string = "", include.rownames = FALSE, size = fontSize, caption.placement = captionPlacement, type = tableType,
    sanitize.text.function = function(x) {
      x
    }
  )
} # sanitize.text.function = identity



#' @title fmt
#' @description Formatting function to set decimal precision in labels
#' @author Lech Madeyski
#' @export fmt
fmt <- function() {
  function(x) format(x, nsmall = 3, scientific = FALSE)
}
