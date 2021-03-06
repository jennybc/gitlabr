% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ci.R
\name{gl_pipelines}
\alias{gl_builds}
\alias{gl_jobs}
\alias{gl_latest_build_artifact}
\alias{gl_pipelines}
\title{Access the Gitlab CI builds}
\usage{
gl_pipelines(project, ...)

gl_jobs(project, ...)

gl_builds(project, force_api_v3 = TRUE, ...)

gl_latest_build_artifact(project, job, ref_name = "master",
  save_to_file = tempfile(fileext = ".zip"), ...)
}
\arguments{
\item{project}{project name or id, required}

\item{...}{passed on to \code{\link{gitlab}} API call}

\item{force_api_v3}{Since \code{gl_builds} is no longer working for Gitlab API v4,
this must be set to TRUE in order to avoid deprecation warning and HTTP error.  It currently
default to TRUE, but this will change with gitlabr 1.0.}

\item{job}{Name of the job to get build artifacts from}

\item{ref_name}{name of ref (i.e. branch, commit, tag)}

\item{save_to_file}{either a path where to store .zip file or NULL if raw should be returned}
}
\value{
returns the file path if \code{save_to_file} is TRUE, or the archive as raw otherwise.
}
\description{
List the jobs with \code{gl_jobs}, the pipelines with \code{gl_pipelines} or
download the most recent artifacts
archive with \code{gl_latest_build_artifact}. For every branch and job combination
only the most recent artifacts archive is available.
\code{gl_builds} is the equivalent for gitlab API v3.
}
\examples{
\dontrun{
my_gitlab <- gl_connection(...) ## fill in login parameters
my_gitlab(gl_pipelines, "test-project")
my_gitlab(gl_jobs, "test-project")
my_gitlab(gl_latest_build_artifact, "test-project", job = "build")
}
}

