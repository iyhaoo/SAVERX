% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_autoencoder.R
\name{autoFilterCV}
\alias{autoFilterCV}
\title{Cross-validation filtering of autoencoder}
\usage{
autoFilterCV(x, python.module, main, pretrain_file = "",
  nonmissing_indicator = 1, n_human = 21183L, n_mouse = 21122L,
  shared_size = 15494L, model.species = NULL, out_dir = ".",
  batch_size = 32L, write_output_to_tsv = F, fold = 6, samp = 3,
  epsilon = 1e-10, seed = 1, ...)
}
\arguments{
\item{x}{Target sparse data matrix of gene by cell. When pretraining is used, the genes should be the same as the nodes used in the pretrained model. If a node gene is missing is the target dataset, set all values of that gene as 0 in \code{x} and indicate that using \code{nonmissing_indicator}}

\item{python.module}{The python module for the Python package \code{sctransfer}}

\item{main}{A Python main module}

\item{pretrain_file}{The pretrained weights file ended with '.hdf5'}

\item{nonmissing_indicator}{A single value 1 or a vector of 0 and 1s to indicate which nodes are missing in the target dataset. Set to 1 for no pretraining.}

\item{model.species}{Should be either 'Human' or 'Mouse' when pretraining is used}

\item{write_output_to_tsv}{If True, then the result of Python is written as .tsv files instead of passing back to R. Default is False.}

\item{fold}{Number of total CV folds}

\item{samp}{Number of sampled folds taken to reduce CV time cost}

\item{...}{Extra parameters passed to Python module \code{sctransfer} function \code{api} (if no pretraining) or function \code{api_pretrain} (with pretraining).}
}
\value{
a list of the filtered predicted data matrix and the CV error
}
\description{
Cross-validation is done to determine which genes can not be predicted well, by comparing the autoencoder predicted loss with the loss estimating the gene expression as a constant across cells
}
