% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ltr_age_estimation.R
\name{ltr_age_estimation}
\alias{ltr_age_estimation}
\title{Estimate retrotransposon insertion age in Mya based on 5 prime and 3 prime LTR sequence homology}
\usage{
ltr_age_estimation(ltr_seqs_3_prime, ltr_seqs_5_prime, model = "K80",
  mutation_rate = 1.3 * 1e-07)
}
\arguments{
\item{ltr_seqs_3_prime}{file path to a fasta file storing the sequences of the respective 3 prime LTR (e.g. as annotatted by \code{\link{LTRpred}}).}

\item{ltr_seqs_5_prime}{file path to a fasta file storing the sequences of the respective 5 prime LTR (e.g. as annotatted by \code{\link{LTRpred}}).}

\item{model}{a model as specified in \code{\link[ape]{dist.dna}}: a character string specifying the evolutionary model to be used - must be one of
\code{raw}, \code{N}, \code{TS}, \code{TV}, \code{JC69}, \code{K80} (the default), \code{F81}, \code{K81}, \code{F84}, \code{BH87}, \code{T92},
 \code{TN93}, \code{GG95}, \code{logdet}, \code{paralin}.}

\item{mutation_rate}{a mutation rate per site per year. For retrotransposons the default is \eqn{mutation_rate = 1.3 * 10E-8} (Wicker and Keller, 2007).}
}
\description{
This function implements diverse metrics to roughly estimate
the insertion age in Mya based on 5 prime and 3 prime LTR sequence homology.
}
\examples{
\dontrun{
# define file path to fasta file storing 3 prime LTR sequences
ltr_seqs_3_prime <- system.file("Hsapiens_ChrY-ltrdigest_3ltr.fas", package = "LTRpred")
ltr_seqs_5_prime <- system.file("Hsapiens_ChrY-ltrdigest_5ltr.fas", package = "LTRpred")
# estimate insertion age based on 3 prime and 5 prime LTR homology using the K80 model
Hsapiens_ltr_age <- ltr_age_estimation(ltr_seqs_3_prime, ltr_seqs_5_prime)
# look at results
Hsapiens_ltr_age
}
}
\author{
Hajk-Georg Drost
}
