#' User interface of dotprofile
#'
#' These functions are used to construct the command-line interface of
#' \pkg{dotprofile}. They are inspired from \pkg{usethis} for consistency,
#' but their implementation is different and relies on wrapper functions
#' to other functions of \pkg{cli}.
#'
#' @name dotprofile-ui
#'
#' @usage
#' ## ---
#' ## Print messages to the console
#' ## ---
#'
#' ui_todo(..., .envir = parent.frame())
#'
#' @param ... `[any]`
#'
#'   Passed to [cli::format_inline()], unless stated otherwise below.
#'   Use \pkg{cli} [inline markup][cli::inline-markup] for inline formatting.
#'
#'   ## Functions [ui_warn()] and [ui_stop()]
#'
#'   `...` is an optional sequence of further calls executed after returning a
#'   message via [base::warning()] and [base::stop()] respectively. You should
#'   only pass calls to other user interface functions. See examples below.
#'
#' @param answers `[atomic]`
#'
#'   Non-empty [atomic vector][base::vector()] passed to argument
#'   `choices` of [utils::menu()].
#'
#' @param warning `[character(1)]`
#'
#'   Passed to [cli::format_warning()].
#'
#' @param error `[character(1)]`
#'
#'   Passed to [cli::format_error()].
#'
#' @param .envir `[environment]`
#'
#'   Passed to [cli::format_inline()], [cli::format_warning()]
#'   or [cli::format_error()]. This argument is __not__ validated by
#'   \pkg{dotprofile} and is reserved for expert use.
#'
#' @returns
#'   * Functions [ui_todo()], [ui_info()], [ui_done()], [ui_nope()],
#'   [ui_ask()], and [ui_theme()] return `NULL` invisibly.
#'
#'   * Function [ui_input()] returns a `character(1)`. It returns an
#'   empty `character(1)` in non-interactive sessions.
#'
#'   * Function [ui_menu()] returns the *chosen* value taken from argument
#'   `answers`. In non-interactive sessions, or if the user aborts the process,
#'   it returns `NA`. Its actual type matches the type of the value passed to
#'   argument `answers`.
#'
#'   * Function [ui_warn()] throws a warning, but __does not stop__ execution
#'   of the current expression. It returns `NULL` invisibly.
#'
#'   * Function [ui_stop()] throws an error message and __stops__ execution
#'   of the current expression.
#'
#' @details The user interface functions of \pkg{dotprofile} can be divided
#'   into three groups.
#'
#'   1. Print messages with [ui_todo()], [ui_info()], [ui_done()],
#'   [ui_warn()], [ui_ask()] and [ui_nope()].
#'
#'   2. Seek *answers* from the user with [ui_input()] and [ui_menu()].
#'   The former expects an input to be typed in the terminal, while the
#'   latter expects a value to be chosen interactively from a menu. These
#'   functions can only be used in an [interactive][interactive()] session.
#'
#'   3. Signal conditions with [ui_warn()] and [ui_stop()]. They are
#'   designed to play nicely with `ui_*()` functions of the first group,
#'   and can be used to craft beautiful and meaningful error messages.
#'
#'   All functions support [string interpolation][cli::inline-markup].
#'
#' @examples
#' ## Use dotprofile's UI functions to convey messages to the user.
#' ui_examples <- function()
#' {
#'     ui_todo("This is a {.strong to-be-completed} task.")
#'     ui_info("This is an information.")
#'     ui_done("This a {.strong completed} task.")
#'     ui_nope("Something's {.strong wrong}, but this is not an error.")
#'     ui_ask("This is a question.")
#' }
#'
#' ui_examples()
#'
#' ## Use cli's inline classes to easily style messages passed to `...`
#' ui_theme()
#'
#' ## Construct beautiful warnings and errors with ui_warn() and ui_stop().
#' \dontrun{
#'   ui_warn("this is a warning message generated with {.fn ui_warn}.")
#'   ui_warn("this is a {.emph super custom} warning message.",
#'       ui_info("You can pass other {.fn ui_*} calls to it."),
#'       ui_info("They are printed after the warning message, like {.pkg rlang} does."),
#'       ui_nope("Only use functions that has side-effects here.")
#'   )
#'
#'   ui_stop("this is an error message generated with {.fn ui_stop}.")
#'   ui_stop("this is a {.emph super custom} error message.",
#'       ui_info("You can pass other {.fn ui_*} calls to it."),
#'       ui_info("They are printed after the error message, like {.pkg rlang} does."),
#'       ui_nope("Only use functions that has side-effects here.")
#'   )}
#'
#' @export
ui_todo <- function(..., .envir = parent.frame())
{
    cli::cat_bullet(
        cli::format_inline(..., .envir = .envir),
        bullet     = "record",
        bullet_col = "red")

    return(invisible())
}

#' @rdname dotprofile-ui
#' @export
ui_info <- function(..., .envir = parent.frame())
{
    # The `info` does not have the same width
    # as other `bullet` characters. Therefore,
    # we adjust it by inserting a Unicode Thin
    # Space character (U+2009) before messages
    # passed to `...`. For more information, see
    # https://www.compart.com/en/unicode/U+2009.
    cli::cat_bullet(
        cli::format_inline("\U2009", ..., .envir = .envir),
        bullet     = "info",
        bullet_col = "cyan")

    return(invisible())
}

#' @rdname dotprofile-ui
#' @export
ui_done <- function(..., .envir = parent.frame())
{
    cli::cat_bullet(
        cli::format_inline(..., .envir = .envir),
        bullet     = "tick",
        bullet_col = "green")

    return(invisible())
}

#' @rdname dotprofile-ui
#' @export
ui_nope <- function(..., .envir = parent.frame())
{
    cli::cat_bullet(
        cli::format_inline(..., .envir = .envir),
        bullet     = "cross",
        bullet_col = "red")

    return(invisible())
}

#' @rdname dotprofile-ui
#' @export
ui_ask <- function(..., .envir = parent.frame())
{
    bullet <- cli::col_yellow("? ")
    text   <- cli::format_inline(bullet, ..., .envir = .envir)
    cli::cat_line(text)

    return(invisible())
}

#' @rdname dotprofile-ui
#'
#' @usage
#' ## ---
#' ## Ask for inputs interactively
#' ## ---
#'
#' ui_input(..., .envir = parent.frame())
#'
#' @export
ui_input <- function(..., .envir = parent.frame())
{
    # This is an interactive function that
    # cannot be tested in a non-interactive
    # session. Therefore, it is partially
    # ignored by covr.
    # ---
    # However, its interactive mechanism is
    # actually tested, whenever testthat is
    # ran in an interactive session. See
    # file tests/testthat/test-ui.R.

    ui_ask(..., .envir = .envir)
    ui_todo("Type your answer below.")

    # In non-interactive mode, readline()
    # returns an empty character(1): "".
    # This value is explicitly returned in
    # non-interactive mode by ui_input().
    # This makes it easier to partially
    # test this function.
    if (interactive()) {
        return(readline(sprintf("   %s ", cli::symbol$play))) # nocov
    } else {
        ""
    }
}

#' @rdname dotprofile-ui
#' @export
ui_menu <- function(..., answers = c("yes", "no"), .envir = parent.frame())
{
    # This is an interactive function that
    # cannot be tested in a non-interactive
    # session. Therefore, it is partially
    # ignored by covr.
    # ---
    # However, its interactive mechanism is
    # actually tested, whenever testthat is
    # ran in an interactive session. See
    # file tests/testthat/test-ui.R.

    # Checking for 0-length values also checks
    # for NULL values. These are not permitted.
    if (!is.atomic(answers) || !length(answers)) {
        ui_stop("{.arg answers} must be an atomic vector with a length greater than 0.")
    }

    ui_ask(..., .envir = .envir)
    ui_todo("Type a number below, or type {.code 0} to exit.")

    # In interactive mode, a menu is presented
    # to the user. It returns the index of
    # whatever the user chose. Else, index 0
    # is returned by default.
    # ---
    # The output of utils::menu() can be 0.
    # This implies that the user aborted the
    # process.
    ans_index <- if (interactive()) {
        utils::menu(answers, FALSE, NULL) # nocov
    } else {
        0L
    }

    # If index is greater than 0, return
    # the underlying element taken from
    # `answers`. Else, return a NA value
    # of a type given by the underlying
    # `answers` vector. This is done by
    # trying to subset a non-existent
    # element from `answers`.
    if (ans_index) {
        return(answers[[ans_index]]) # nocov
    } else {
        return(answers[length(answers) + 1L])
    }
}

#' @rdname dotprofile-ui
#'
#' @usage
#' ## ---
#' ## Signal conditions
#' ## ---
#'
#' ui_warn(warning, ..., .envir = parent.frame())
#'
#' @export
ui_warn <- function(warning, ..., .envir = parent.frame())
{
    # Defer evaluation of calls passed to `...`.
    # ---
    # They are executed after returning a warning,
    # and before exiting function. Therefore, the
    # warning message is returned first, followed
    # by any additional information on it.
    # ---
    # Calls passed to `...` should normally be
    # calls made to other `ui_*()` functions.
    # You can also pass calls to `base::cat()`
    # and some `cli::cli_*()` functions.
    on.exit(add = TRUE, after = TRUE, expr = {
        for (i in seq_len(...length())) {
            ...elt(i)
        }
    })

    warning <- cli::format_warning(warning, .envir = .envir)
    base::warning(warning, call. = FALSE, immediate. = TRUE)

    return(invisible())
}

#' @rdname dotprofile-ui
#' @export
ui_stop <- function(error, ..., .envir = parent.frame())
{
    # Defer evaluation of calls passed to `...`.
    # ---
    # They are executed after returning an error,
    # and before exiting function. Therefore, the
    # error message is returned first, followed by
    # any additional information on it.
    # ---
    # Calls passed to `...` should normally be
    # calls made to other `ui_*()` functions.
    # You can also pass calls to `base::cat()`
    # and some `cli::cli_*()` functions.
    on.exit(add = TRUE, after = TRUE, expr = {
        for (i in seq_len(...length())) {
            ...elt(i)
        }
    })

    error <- cli::format_error(error, .envir = .envir)
    base::stop(error, call. = FALSE)
}

#' @rdname dotprofile-ui
#'
#' @usage
#' ## ---
#' ## Cheatsheet for inline markup
#' ## ---
#'
#' ui_theme()
#'
#' @export
ui_theme <- function()
{
    cli::cli_h1("Classes of {.pkg dotprofile} UI functions")

    p <- cli::cli_par()
    cli::cli_text(
        "Classes below can be used within {.fn ui_*} functions.
         They are all inherited from {.pkg cli}'s built-in inline markup.")
    cli::cli_end(p)

    ul <- cli::cli_ul()
    cli::cli_li(".arg   : {.arg argument} of a function")
    cli::cli_li(".cls   : S3, S4, or R6 {.cls class}")
    cli::cli_li(".code  : a piece of code: {.code sum(a) / length(a)}")
    cli::cli_li(".dt    : a {.dt formal term} to be described")
    cli::cli_li(".dd    : a {.dt formal term} {.dd to be described here}")
    cli::cli_li(".email : an email address: {.email hello@domain.com}")
    cli::cli_li(".emph  : {.emph Emphasized} text")
    cli::cli_li(".envvar: an environment variable: {.envvar R_LIBS}")
    cli::cli_li(".field : some {.field field}")
    cli::cli_li(".file  : a file name: {.file /usr/bin/env}")
    cli::cli_li(".fn    : a function name: {.fn cli_text}")
    cli::cli_li(".pkg   : a package name: {.pkg cli}")
    cli::cli_li(".kbd   : a keyboard key: press {.kbd ENTER}")
    cli::cli_li(".path  : a path: {.path /usr/bin/env}")
    cli::cli_li(".pkg   : a package: {.pkg dotprofile}")
    cli::cli_li(".strong: a text of {.strong strong} importance")
    cli::cli_li(".url   : a url: {.url https://domain.com}")
    cli::cli_li(".var   : a variable name: {.var my_var}")
    cli::cli_li(".val   : some generic {.val value}")
    cli::cli_end(ul)

    return(invisible())
}
