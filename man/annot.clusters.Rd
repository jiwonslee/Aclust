% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annot.clusters.R
\name{annot.clusters}
\alias{annot.clusters}
\title{Title Annotate vectors of Illumina probe names, each vector represent different cluster}
\usage{
annot.clusters(clusters.list, annot = NULL,
  annotation.file.name = NULL, required.annotation = c("IlmnID",
  "Coordinate_37", "UCSC_RefGene_Name", "UCSC_RefGene_Group",
  "UCSC_CpG_Islands_Name", "Relation_to_UCSC_CpG_Island"))
}
\arguments{
\item{clusters.list}{A list in which each element is a vector of illumine probe names.}

\item{annot}{A preloaded data.table of annotation}

\item{annotation.file.name}{If annot is not given, annotation.file.name can provide the file name of the illumine annotation file and the function will load and convert it to a data.table. 
If neither annot nor annotation.file.name are provided, annotation will be loaded from Tim Triche's bioconductor R package.}

\item{required.annotation}{Names of columns from Illumina annotation file, to be provided as annotation}
}
\value{
A list corresponding to clusters.list. Each element in the list is matrix of required.annotations  for each of the probes in the vector in the corresponding element in clusters list
}
\description{
Returns a list of matrices with annotations of the CpG sites represented by vector of probe names. Each vector represent a cluster
}
\examples{

data(betas.7) ## upload methylation data
exposure <- rbinom(ncol(betas.7), 1,prob = 0.5) ## generate random exposure
covariates <- matrix(rnorm(2*ncol(betas.7)), ncol = 2)
data(annot.7)
clusters.list <- assign.to.clusters(betas.7, annot.7)
annotated.clusters <- annot.clusters(clusters.list[1:10], annot = annot.7, required.annotation = c("IlmnID", "Coordinate_37", "UCSC_RefGene_Name", "UCSC_RefGene_Group"))

}
