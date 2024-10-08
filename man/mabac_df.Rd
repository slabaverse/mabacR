% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mabac_df.R
\docType{data}
\name{mabac_df}
\alias{mabac_df}
\title{Data set about Forklifts}
\format{
An object of class \code{"data.frame"}
\describe{
 \item{criteria}{sets of criteria used for the decision. The data is located in the first column}
 \item{weights}{Weights defined by the decision maker for each criterion.
 The weights range from 0 to 1, with those close to 0 being the least relevant and those close to 1 being the most relevant
 The sum of the weights must be equal to 1. The weights are located in the second column.}
 \item{type}{The types, which are located in the third column, can be benefits (1),
 which are those that we want to maximize, or they can be costs (-1), which are those that we want to minimize.}
 \item{itens}{From the fourth column are the evaluated items.
 The values of these items do not need to be on the same scale and can be qualitative or quantitative.}
 }
}
\usage{
data(mabac_df)
}
\description{
This is the database of the original paper that introduced the MABAC method.
It presents the criteria defined for selecting items (C1, C2,...);
the weights that each criterion will have in the final decision, ranging from 0 to 1,
the closer to 1 the more impactful this criterion will be. The sum of the weights must be equal to 1;
the type of criterion, whether it is maximization/benefit (1) or minimization/cost (-1)
and the items evaluated (A1, A2,...).
}
\examples{
head(mabac_df)

}
\references{
This data set was created by Dragan Pamucar and Goran Cirovic.
PAMUČAR, D.; ĆIROVIĆ, G. The selection of transport and handling resources in logistics centers
using Multi-Attributive Border Approximation area Comparison (MABAC).
Expert systems with applications, v. 42, n. 6, p. 3016–3028, 2015.
}
\keyword{datasets}
