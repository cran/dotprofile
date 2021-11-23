# ui_todo() works [plain]

    Code
      ui_todo("This is a todo.")
    Output
      o This is a todo.

# ui_todo() works [ansi]

    Code
      ui_todo("This is a todo.")
    Output
      [31mo[39m This is a todo.

# ui_todo() works [unicode]

    Code
      ui_todo("This is a todo.")
    Output
      ● This is a todo.

# ui_todo() works [fancy]

    Code
      ui_todo("This is a todo.")
    Output
      [31m●[39m This is a todo.

# ui_info() works on Linux, Mac, and Solaris [plain]

    Code
      ui_info("This is an information.")
    Output
      i  This is an information.

# ui_info() works on Linux, Mac, and Solaris [ansi]

    Code
      ui_info("This is an information.")
    Output
      [36mi[39m  This is an information.

# ui_info() works on Linux, Mac, and Solaris [unicode]

    Code
      ui_info("This is an information.")
    Output
      ℹ  This is an information.

# ui_info() works on Linux, Mac, and Solaris [fancy]

    Code
      ui_info("This is an information.")
    Output
      [36mℹ[39m  This is an information.

# ui_done() works [plain]

    Code
      ui_done("This is a task that was executed.")
    Output
      v This is a task that was executed.

# ui_done() works [ansi]

    Code
      ui_done("This is a task that was executed.")
    Output
      [32mv[39m This is a task that was executed.

# ui_done() works [unicode]

    Code
      ui_done("This is a task that was executed.")
    Output
      ✔ This is a task that was executed.

# ui_done() works [fancy]

    Code
      ui_done("This is a task that was executed.")
    Output
      [32m✔[39m This is a task that was executed.

# ui_nope() works [plain]

    Code
      ui_nope("This is something important that you must read.")
    Output
      x This is something important that you must read.

# ui_nope() works [ansi]

    Code
      ui_nope("This is something important that you must read.")
    Output
      [31mx[39m This is something important that you must read.

# ui_nope() works [unicode]

    Code
      ui_nope("This is something important that you must read.")
    Output
      ✖ This is something important that you must read.

# ui_nope() works [fancy]

    Code
      ui_nope("This is something important that you must read.")
    Output
      [31m✖[39m This is something important that you must read.

# ui_ask() works [plain]

    Code
      ui_ask("This is a question.")
    Output
      ? This is a question.

# ui_ask() works [ansi]

    Code
      ui_ask("This is a question.")
    Output
      [33m? [39mThis is a question.

# ui_ask() works [unicode]

    Code
      ui_ask("This is a question.")
    Output
      ? This is a question.

# ui_ask() works [fancy]

    Code
      ui_ask("This is a question.")
    Output
      [33m? [39mThis is a question.

# ui_input() messages works [plain]

    Code
      ui_input("Some input can be typed.")
    Output
      ? Some input can be typed.
      o Type your answer below.
      [1] ""

# ui_input() messages works [ansi]

    Code
      ui_input("Some input can be typed.")
    Output
      [33m? [39mSome input can be typed.
      [31mo[39m Type your answer below.
      [1] ""

# ui_input() messages works [unicode]

    Code
      ui_input("Some input can be typed.")
    Output
      ? Some input can be typed.
      ● Type your answer below.
      [1] ""

# ui_input() messages works [fancy]

    Code
      ui_input("Some input can be typed.")
    Output
      [33m? [39mSome input can be typed.
      [31m●[39m Type your answer below.
      [1] ""

# ui_menu() messages works [plain]

    Code
      ui_menu("Some choice can be typed")
    Output
      ? Some choice can be typed
      o Type a number below, or type `0` to exit.
      [1] NA

# ui_menu() messages works [ansi]

    Code
      ui_menu("Some choice can be typed")
    Output
      [33m? [39mSome choice can be typed
      [31mo[39m Type a number below, or type [30m[47m`0`[49m[39m to exit.
      [1] NA

# ui_menu() messages works [unicode]

    Code
      ui_menu("Some choice can be typed")
    Output
      ? Some choice can be typed
      ● Type a number below, or type `0` to exit.
      [1] NA

# ui_menu() messages works [fancy]

    Code
      ui_menu("Some choice can be typed")
    Output
      [33m? [39mSome choice can be typed
      [31m●[39m Type a number below, or type [30m[47m`0`[49m[39m to exit.
      [1] NA

# ui_warn() works [plain]

    Code
      ui_warn("this is a warning.", ui_todo(
        "this is a {.fn ui_*} call that follows the warning."))
    Warning <simpleWarning>
      this is a warning.
    Output
      o this is a `ui_*()` call that follows the warning.

# ui_warn() works [ansi]

    Code
      ui_warn("this is a warning.", ui_todo(
        "this is a {.fn ui_*} call that follows the warning."))
    Warning <simpleWarning>
      [1m[22mthis is a warning.
    Output
      [31mo[39m this is a [30m[47m`ui_*()`[49m[39m call that follows the warning.

# ui_warn() works [unicode]

    Code
      ui_warn("this is a warning.", ui_todo(
        "this is a {.fn ui_*} call that follows the warning."))
    Warning <simpleWarning>
      this is a warning.
    Output
      ● this is a `ui_*()` call that follows the warning.

# ui_warn() works [fancy]

    Code
      ui_warn("this is a warning.", ui_todo(
        "this is a {.fn ui_*} call that follows the warning."))
    Warning <simpleWarning>
      [1m[22mthis is a warning.
    Output
      [31m●[39m this is a [30m[47m`ui_*()`[49m[39m call that follows the warning.

# ui_stop() works [plain]

    Code
      ui_stop("this is an error.", ui_todo(
        "this is a {.fn ui_*} call that follows the error."))
    Error <simpleError>
      this is an error.
    Output
      o this is a `ui_*()` call that follows the error.

# ui_stop() works [ansi]

    Code
      ui_stop("this is an error.", ui_todo(
        "this is a {.fn ui_*} call that follows the error."))
    Error <simpleError>
      [1m[22mthis is an error.
    Output
      [31mo[39m this is a [30m[47m`ui_*()`[49m[39m call that follows the error.

# ui_stop() works [unicode]

    Code
      ui_stop("this is an error.", ui_todo(
        "this is a {.fn ui_*} call that follows the error."))
    Error <simpleError>
      this is an error.
    Output
      ● this is a `ui_*()` call that follows the error.

# ui_stop() works [fancy]

    Code
      ui_stop("this is an error.", ui_todo(
        "this is a {.fn ui_*} call that follows the error."))
    Error <simpleError>
      [1m[22mthis is an error.
    Output
      [31m●[39m this is a [30m[47m`ui_*()`[49m[39m call that follows the error.

# ui_theme() works [plain]

    Code
      ui_theme()
    Message <cliMessage>
      
      -- Classes of dotprofile UI functions ------------------------------------------
      Classes below can be used within `ui_*()` functions. They are all inherited
      from cli's built-in inline markup.
      
      * .arg : `argument` of a function
      * .cls : S3, S4, or R6 <class>
      * .code : a piece of code: `sum(a) / length(a)`
      * .dt : a formal term: to be described
      * .dd : a formal term: to be described here
      * .email : an email address: 'hello@domain.com'
      * .emph : Emphasized text
      * .envvar: an environment variable: `R_LIBS`
      * .field : some field
      * .file : a file name: '/usr/bin/env'
      * .fn : a function name: `cli_text()`
      * .pkg : a package name: cli
      * .kbd : a keyboard key: press [ENTER]
      * .path : a path: '/usr/bin/env'
      * .pkg : a package: dotprofile
      * .strong: a text of strong importance
      * .url : a url: <https://domain.com>
      * .var : a variable name: `my_var`
      * .val : some generic "value"

# ui_theme() works [ansi]

    Code
      ui_theme()
    Message <cliMessage>
      
      [36m--[39m [1mClasses of [34mdotprofile[39m UI functions[22m [36m------------------------------------------[39m
      Classes below can be used within [30m[47m`ui_*()`[49m[39m functions. They are all inherited
      from [34mcli[39m's built-in inline markup.
      
      * .arg : [30m[47m`argument`[49m[39m of a function
      * .cls : S3, S4, or R6 [34m<class>[39m
      * .code : a piece of code: [30m[47m`sum(a) / length(a)`[49m[39m
      * .dt : a formal term: to be described
      * .dd : a formal term: to be described here
      * .email : an email address: [34mhello@domain.com[39m
      * .emph : [3mEmphasized[23m text
      * .envvar: an environment variable: [30m[47m`R_LIBS`[49m[39m
      * .field : some [32mfield[39m
      * .file : a file name: [34m/usr/bin/env[39m
      * .fn : a function name: [30m[47m`cli_text()`[49m[39m
      * .pkg : a package name: [34mcli[39m
      * .kbd : a keyboard key: press [34m[ENTER][39m
      * .path : a path: [34m/usr/bin/env[39m
      * .pkg : a package: [34mdotprofile[39m
      * .strong: a text of [1mstrong[22m importance
      * .url : a url: [3m[34m<https://domain.com>[39m[23m
      * .var : a variable name: [30m[47m`my_var`[49m[39m
      * .val : some generic [34m"value"[39m

# ui_theme() works [unicode]

    Code
      ui_theme()
    Message <cliMessage>
      
      ── Classes of dotprofile UI functions ──────────────────────────────────────────
      Classes below can be used within `ui_*()` functions. They are all inherited
      from cli's built-in inline markup.
      
      • .arg : `argument` of a function
      • .cls : S3, S4, or R6 <class>
      • .code : a piece of code: `sum(a) / length(a)`
      • .dt : a formal term: to be described
      • .dd : a formal term: to be described here
      • .email : an email address: 'hello@domain.com'
      • .emph : Emphasized text
      • .envvar: an environment variable: `R_LIBS`
      • .field : some field
      • .file : a file name: '/usr/bin/env'
      • .fn : a function name: `cli_text()`
      • .pkg : a package name: cli
      • .kbd : a keyboard key: press [ENTER]
      • .path : a path: '/usr/bin/env'
      • .pkg : a package: dotprofile
      • .strong: a text of strong importance
      • .url : a url: <https://domain.com>
      • .var : a variable name: `my_var`
      • .val : some generic "value"

# ui_theme() works [fancy]

    Code
      ui_theme()
    Message <cliMessage>
      
      [36m──[39m [1mClasses of [34mdotprofile[39m UI functions[22m [36m──────────────────────────────────────────[39m
      Classes below can be used within [30m[47m`ui_*()`[49m[39m functions. They are all inherited
      from [34mcli[39m's built-in inline markup.
      
      • .arg : [30m[47m`argument`[49m[39m of a function
      • .cls : S3, S4, or R6 [34m<class>[39m
      • .code : a piece of code: [30m[47m`sum(a) / length(a)`[49m[39m
      • .dt : a formal term: to be described
      • .dd : a formal term: to be described here
      • .email : an email address: [34mhello@domain.com[39m
      • .emph : [3mEmphasized[23m text
      • .envvar: an environment variable: [30m[47m`R_LIBS`[49m[39m
      • .field : some [32mfield[39m
      • .file : a file name: [34m/usr/bin/env[39m
      • .fn : a function name: [30m[47m`cli_text()`[49m[39m
      • .pkg : a package name: [34mcli[39m
      • .kbd : a keyboard key: press [34m[ENTER][39m
      • .path : a path: [34m/usr/bin/env[39m
      • .pkg : a package: [34mdotprofile[39m
      • .strong: a text of [1mstrong[22m importance
      • .url : a url: [3m[34m<https://domain.com>[39m[23m
      • .var : a variable name: [30m[47m`my_var`[49m[39m
      • .val : some generic [34m"value"[39m

# ui_menu() validates argument answers

    `answers` must be an atomic vector with a length greater than 0.

