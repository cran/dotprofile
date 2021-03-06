% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ui.R
\name{dotprofile-ui}
\alias{dotprofile-ui}
\alias{ui_todo}
\alias{ui_info}
\alias{ui_done}
\alias{ui_nope}
\alias{ui_ask}
\alias{ui_input}
\alias{ui_menu}
\alias{ui_warn}
\alias{ui_stop}
\alias{ui_theme}
\title{User interface of dotprofile}
\usage{
## ---
## Print messages to the console
## ---

ui_todo(..., .envir = parent.frame())

ui_info(..., .envir = parent.frame())

ui_done(..., .envir = parent.frame())

ui_nope(..., .envir = parent.frame())

ui_ask(..., .envir = parent.frame())

## ---
## Ask for inputs interactively
## ---

ui_input(..., .envir = parent.frame())

ui_menu(..., answers = c("yes", "no"), .envir = parent.frame())

## ---
## Signal conditions
## ---

ui_warn(warning, ..., .envir = parent.frame())

ui_stop(error, ..., .envir = parent.frame())

## ---
## Cheatsheet for inline markup
## ---

ui_theme()
}
\arguments{
\item{...}{\verb{[any]}

Passed to \code{\link[cli:format_inline]{cli::format_inline()}}, unless stated otherwise below.
Use \pkg{cli} \link[cli:inline-markup]{inline markup} for inline formatting.
\subsection{Functions \code{\link[=ui_warn]{ui_warn()}} and \code{\link[=ui_stop]{ui_stop()}}}{

\code{...} is an optional sequence of further calls executed after returning a
message via \code{\link[base:warning]{base::warning()}} and \code{\link[base:stop]{base::stop()}} respectively. You should
only pass calls to other user interface functions. See examples below.
}}

\item{.envir}{\verb{[environment]}

Passed to \code{\link[cli:format_inline]{cli::format_inline()}}, \code{\link[cli:format_error]{cli::format_warning()}}
or \code{\link[cli:format_error]{cli::format_error()}}. This argument is \strong{not} validated by
\pkg{dotprofile} and is reserved for expert use.}

\item{answers}{\verb{[atomic]}

Non-empty \link[base:vector]{atomic vector} passed to argument
\code{choices} of \code{\link[utils:menu]{utils::menu()}}.}

\item{warning}{\verb{[character(1)]}

Passed to \code{\link[cli:format_error]{cli::format_warning()}}.}

\item{error}{\verb{[character(1)]}

Passed to \code{\link[cli:format_error]{cli::format_error()}}.}
}
\value{
\itemize{
\item Functions \code{\link[=ui_todo]{ui_todo()}}, \code{\link[=ui_info]{ui_info()}}, \code{\link[=ui_done]{ui_done()}}, \code{\link[=ui_nope]{ui_nope()}},
\code{\link[=ui_ask]{ui_ask()}}, and \code{\link[=ui_theme]{ui_theme()}} return \code{NULL} invisibly.
\item Function \code{\link[=ui_input]{ui_input()}} returns a \code{character(1)}. It returns an
empty \code{character(1)} in non-interactive sessions.
\item Function \code{\link[=ui_menu]{ui_menu()}} returns the \emph{chosen} value taken from argument
\code{answers}. In non-interactive sessions, or if the user aborts the process,
it returns \code{NA}. Its actual type matches the type of the value passed to
argument \code{answers}.
\item Function \code{\link[=ui_warn]{ui_warn()}} throws a warning, but \strong{does not stop} execution
of the current expression. It returns \code{NULL} invisibly.
\item Function \code{\link[=ui_stop]{ui_stop()}} throws an error message and \strong{stops} execution
of the current expression.
}
}
\description{
These functions are used to construct the command-line interface of
\pkg{dotprofile}. They are inspired from \pkg{usethis} for consistency,
but their implementation is different and relies on wrapper functions
to other functions of \pkg{cli}.
}
\details{
The user interface functions of \pkg{dotprofile} can be divided
into three groups.
\enumerate{
\item Print messages with \code{\link[=ui_todo]{ui_todo()}}, \code{\link[=ui_info]{ui_info()}}, \code{\link[=ui_done]{ui_done()}},
\code{\link[=ui_warn]{ui_warn()}}, \code{\link[=ui_ask]{ui_ask()}} and \code{\link[=ui_nope]{ui_nope()}}.
\item Seek \emph{answers} from the user with \code{\link[=ui_input]{ui_input()}} and \code{\link[=ui_menu]{ui_menu()}}.
The former expects an input to be typed in the terminal, while the
latter expects a value to be chosen interactively from a menu. These
functions can only be used in an \link[=interactive]{interactive} session.
\item Signal conditions with \code{\link[=ui_warn]{ui_warn()}} and \code{\link[=ui_stop]{ui_stop()}}. They are
designed to play nicely with \verb{ui_*()} functions of the first group,
and can be used to craft beautiful and meaningful error messages.
}

All functions support \link[cli:inline-markup]{string interpolation}.
}
\examples{
## Use dotprofile's UI functions to convey messages to the user.
ui_examples <- function()
{
    ui_todo("This is a {.strong to-be-completed} task.")
    ui_info("This is an information.")
    ui_done("This a {.strong completed} task.")
    ui_nope("Something's {.strong wrong}, but this is not an error.")
    ui_ask("This is a question.")
}

ui_examples()

## Use cli's inline classes to easily style messages passed to `...`
ui_theme()

## Construct beautiful warnings and errors with ui_warn() and ui_stop().
\dontrun{
  ui_warn("this is a warning message generated with {.fn ui_warn}.")
  ui_warn("this is a {.emph super custom} warning message.",
      ui_info("You can pass other {.fn ui_*} calls to it."),
      ui_info("They are printed after the warning message, like {.pkg rlang} does."),
      ui_nope("Only use functions that has side-effects here.")
  )

  ui_stop("this is an error message generated with {.fn ui_stop}.")
  ui_stop("this is a {.emph super custom} error message.",
      ui_info("You can pass other {.fn ui_*} calls to it."),
      ui_info("They are printed after the error message, like {.pkg rlang} does."),
      ui_nope("Only use functions that has side-effects here.")
  )}

}
