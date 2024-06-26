% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cookPasta.R
\name{cookPasta}
\alias{cookPasta}
\title{Spaghetti-plot fixed and random effects of linear mixed models}
\usage{
cookPasta(
  model = NULL,
  predictor = NULL,
  nested.in = NULL,
  group = NULL,
  ci.int = FALSE,
  ci.lvl = ci.lvl
)
}
\arguments{
\item{model}{lme4 or glmmTMB model object}

\item{predictor}{(Character) Name of predictor (e.g., "time" or "math_score"), as it is present in the model}

\item{nested.in}{(Character) Name of the variable your time points or subjects are nested in (e.g.,"school" or "id")}

\item{group}{(Optional, character) The name of your grouping variable (e.g., "condition" or "gender")}

\item{ci.int}{(Optional, boolean) Enable confidence (prediction) intervals, disabled by default}

\item{ci.lvl}{(Optional, numeric) Set level of confidence (prediction) intervals (default: 0.95). Requires ci.int to be set to TRUE}
}
\value{
Returns a list of two dataframes, in which the first element is the fixed effects dataframe and the second element the random effects dataframe
}
\description{
\code{cookPasta()} creates dataframes from fixed and random effects of 'lme4' or 'glmmTMB' models (e.g., for plotting)
}
