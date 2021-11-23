# ---
# Testing command-line messages
# ---
#
# Per cli::test_that_cli()'s documentation, recording snapshots that contains
# Unicode characters on Windows, should be avoided, because of R's limitation
# to record such characters on this OS. Therefore, snapshots of functions that
# explicitly uses Unicode are recorded and tested under MacOS, Linux, and
# Solaris only. Snapshots are recorded under multiple configuration for each
# expectation.
#
#   - plain   : no ANSI colors, ASCII characters only.
#   - ansi    : ANSI colors, ASCII characters only.
#   - unicode : no ANSI colors, Unicode characters.
#   - fancy   : ANSI colors, Unicode characters.
#
# Check ?cli::test_that_cli() for more information.
#
# ---
# Testing interactive functions
# ---
#
# Functions ui_input() and ui_menu() only work in interactive sessions.
# Therefore, they are tested whenever tests are ran in an interactive session
# controlled by the developer. To do so, set `Config/testthat/parallel` equal
# to false in the DESCRIPTION file, and run devtools::test() from the console.

cli::test_that_cli("ui_todo() works", {
    expect_snapshot(ui_todo("This is a todo."))
})

cli::test_that_cli("ui_info() works on Linux, Mac, and Solaris", {
    # This function explicitly uses a Unicode character
    # that cannot be easily recorded on Windows. Output
    # of ui_info() is manually tested on that platform.
    skip_on_os("windows")
    expect_snapshot(ui_info("This is an information."))
})

cli::test_that_cli("ui_done() works", {
    expect_snapshot(ui_done("This is a task that was executed."))
})

cli::test_that_cli("ui_nope() works", {
    expect_snapshot(ui_nope("This is something important that you must read."))
})

cli::test_that_cli("ui_ask() works", {
    expect_snapshot(ui_ask("This is a question."))
})

cli::test_that_cli("ui_input() messages works", {
    skip_if(interactive())
    expect_snapshot(ui_input("Some input can be typed."))
})

cli::test_that_cli("ui_menu() messages works", {
    skip_if(interactive())
    expect_snapshot(ui_menu("Some choice can be typed"))
})

cli::test_that_cli("ui_warn() works", {
    expect_snapshot(
        ui_warn(
            "this is a warning.",
            ui_todo("this is a {.fn ui_*} call that follows the warning.")
        )
    )
})

cli::test_that_cli("ui_stop() works", {
    expect_snapshot(
        ui_stop(
            "this is an error.",
            ui_todo("this is a {.fn ui_*} call that follows the error.")
        ),
        error = TRUE
    )
})

cli::test_that_cli("ui_theme() works", {
    expect_snapshot(ui_theme())
})

test_that("ui_input() returns an empty string in non-interactive mode", {
    skip_if(interactive())
    expect_identical(ui_input(), "")
})

test_that("ui_input() returns user's input in interactive mode", {
    # This test block prompts the developer to return
    # an input (that must be typed in a command-line).
    skip_on_ci()
    skip_on_covr()
    skip_on_cran()
    skip_if(is_parallel())

    cat("\n") # Ensures testthat reporter's output is not broken.

    expect_identical(ui_input("What is the name of this package?"), "dotprofile")
})

test_that("ui_menu() validates argument answers", {
    expect_error(ui_menu(answers = list()))
    expect_snapshot_error(ui_menu(answers = NULL))
})

test_that("ui_menu() returns NA of a matching type in non-interactive mode", {
    skip_if(interactive())
    expect_identical(ui_menu(answers = "1"),  NA_character_)
    expect_identical(ui_menu(answers = 1+1i), NA_complex_)
    expect_identical(ui_menu(answers = 1.0),  NA_real_)
    expect_identical(ui_menu(answers = 1L),   NA_integer_)
    expect_identical(ui_menu(answers = TRUE), NA)
})

test_that("ui_menu() returns user's choice in interactive mode", {
    # This test block prompts the developer to return
    # an input (that must be typed in a command-line).
    skip_on_ci()
    skip_on_covr()
    skip_on_cran()
    skip_if(is_parallel())

    cat("\n") # Ensures testthat reporter's output is not broken.

    expect_identical(ui_menu("Choose between yes or no."), "yes")
})
