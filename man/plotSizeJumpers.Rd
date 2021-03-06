% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotSizeJumpers.R
\name{plotSizeJumpers}
\alias{plotSizeJumpers}
\title{Plot Genome size vs. LTR transposon count for jumpers}
\usage{
plotSizeJumpers(genome.folder, genome.matrix, ltr.similarity = 98,
  sci.name.len = 1, name.sep = "_",
  main = paste0("Genome size vs. LTR transp. count ( ", ltr.similarity,
  "\% )"), ...)
}
\arguments{
\item{genome.folder}{path to the folder storing all unmasked genomes for which \code{\link[LTRpred]{LTRpred}} based de novo LTR retrotransposon prediction shall be performed.}

\item{genome.matrix}{Genome matrix retruned by \code{\link[LTRpred]{LTRpred.meta}}.}

\item{ltr.similarity}{similarity threshold for defining LTR similarity. This criterion defines
whether LTR transposons are jumpers or not. LTR transposons fulfulling this threshold are considered
as being jumpers.}

\item{sci.name.len}{does the scientific name of the input organisms stored in \code{genome.matrix}
include one name (e.g. Ppaterns, = \code{sci.name.len = 1}) or two names (e.g. Physcomitrella_paterns, = \code{sci.name.len = 2}).}

\item{name.sep}{name separator if organism name in \code{genome.matrix} is for example \code{Ppaterns_ltrpred}. Then \code{name.sep = "_"} should be specified.}

\item{main}{main text of the plot.}

\item{...}{additional arguments passed to \code{\link{plotSize}}.}
}
\description{
Visualize the Genome size vs. LTR transposon count of LTR transposons
that have been classified as jumpers due to their LTR similarity specified
in the \code{ltr.similarity} arument.
}
\author{
Hajk-Georg Drost
}
