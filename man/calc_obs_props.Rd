% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculations.R
\name{calc_obs_props}
\alias{calc_obs_props}
\title{Calculate proportions from observation counts}
\usage{
calc_obs_props(obj, dataset, cols = NULL, other_cols = FALSE,
  out_names = NULL)
}
\arguments{
\item{obj}{A \code{\link[taxa]{taxmap}} object}

\item{dataset}{The name of a table in \code{obj} that contains counts.}

\item{cols}{The names/indexes of columns in \code{dataset} to use. By
default, all numeric columns are used. Takes one of the following inputs:
\describe{
  \item{TRUE/FALSE:}{All/No columns will used.}
  \item{Character vector:}{The names of columns to use}
  \item{Numeric vector:}{The indexes of columns to use}
  \item{Vector of TRUE/FALSE of length equal to the number of columns:}{Use the columns
corresponding to \code{TRUE} values.}
}}

\item{other_cols}{Preserve in the output non-target columns present in the
input data. New columns with proportions will always be on the end. The
"taxon_id" column will always be preserved in the front. Takes one of the
following inputs:
\describe{
  \item{TRUE/FALSE:}{All non-target columns will be preserved or not.}
  \item{Character vector:}{The names of columns to preserve}
  \item{Numeric vector:}{The indexes of columns to preserve}
  \item{Vector of TRUE/FALSE of length equal to the number of columns:}{Preserve the columns
corresponding to \code{TRUE} values.}
}}

\item{out_names}{If supplied, rename the output proportion columns. Must be
the same length as \code{cold}.}
}
\value{
A tibble
}
\description{
For a given table in a \code{\link[taxa]{taxmap}} object, convert one or more
columns containing counts to proportions. This is meant to be used with
counts associated with observations (e.g. OTUs), as opposed to counts that
have already been summed per taxon.
}
\examples{
\dontrun{
# Parse dataset for examples
x = parse_tax_data(hmp_otus, class_cols = "lineage", class_sep = ";",
                   class_key = c(tax_rank = "info", tax_name = "taxon_name"),
                   class_regex = "^(.+)__(.+)$")
                   
# Calculate proportions for all numeric columns
calc_obs_props(x, "tax_data")

# Calculate proportions for a subset of columns
calc_obs_props(x, "tax_data", cols = c("700035949", "700097855", "700100489"))
calc_obs_props(x, "tax_data", cols = 4:6)
calc_obs_props(x, "tax_data", cols = startsWith(colnames(x$data$tax_data), "70001"))

# Including all other columns in ouput
calc_obs_props(x, "tax_data", other_cols = TRUE)

# Inlcuding specific columns in output
calc_obs_props(x, "tax_data", cols = c("700035949", "700097855", "700100489"),
               other_cols = 2:3)
               
# Rename output columns
calc_obs_props(x, "tax_data", cols = c("700035949", "700097855", "700100489"),
               out_names = c("a", "b", "c"))

}
}
\seealso{
Other calculations: \code{\link{calc_n_samples}},
  \code{\link{calc_taxon_abund}},
  \code{\link{compare_groups}}, \code{\link{rarefy_obs}},
  \code{\link{zero_low_counts}}
}
