context("error")
test_that("returns the correct linting", {
  expect_lint("\"\\R\"",
    rex("is an unrecognized escape in character string starting")
    )

  expect_lint("\"\\A\"",
    rex("is an unrecognized escape in character string starting")
    )

  expect_lint("\"\\z\"",
    rex("is an unrecognized escape in character string starting")
    )
  expect_lint("a <- 1
    function() {
    b",
    rex("unexpected end of input"), (function(...) NULL))

  expect_lint("x=",
    rex("unexpected end of input"),
    equals_na_linter
  )
  expect_lint("x += 1",
    rex("unexpected '='"),
    equals_na_linter
  )
  expect_lint("{x = }",
    rex("unexpected '}'"),
    equals_na_linter
  )
  expect_lint("x = ;",
    rex("unexpected ';'"),
    equals_na_linter
  )

  # no parsing error is expected for the equals-assignment in this code
  expect_lint("purrr::partial(list, 1, ... = , 2)",
    NULL,
    equals_na_linter
  )

  expect_lint("\\",
    rex("unexpected input")
  )

  expect_lint("``",
    rex("attempt to use zero-length variable name")
  )

  expect_lint("``()",
    rex("attempt to use zero-length variable name")
  )

  expect_lint("''()",
    rex("attempt to use zero-length variable name")
  )

  expect_lint('""()',
    rex("attempt to use zero-length variable name")
  )

  expect_lint("fun(''=42)",
    rex("attempt to use zero-length variable name")
  )

  expect_lint('fun(""=42)',
    rex("attempt to use zero-length variable name")
  )

  expect_lint('fun(a=1,""=42)',
    rex("attempt to use zero-length variable name")
  )
})
