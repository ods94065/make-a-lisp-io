ReaderTest := UnitTest clone do(
  System launchPath println
  testTokenize := method(
    expected_input_cases := list(
      list(list("~@", "g"), "~@g"),
      list(list("c"), ",c"),
      list(list("[", "]"), "[]"),
      list(list("(", ")"), "()"),
      list(list("{", "}"), "{}"),
      list(list("'", "abc"), "'abc"),
      list(list("`", "abc", "`"), "`abc`"),
      list(list("~", "x"), "~x"),
      list(list("^", "b"), "^b"),
      list(list("@", "n"), "@n"),
      list(list("; a comment"), "; a comment"),
      list(list(";;; section comment"), ";;; section comment"),
      list(list("123"), "123"),
      list(list("1", "23"), "   \n1\t23"),
      list(list("(", "1", "2", ")"), "(1 2)"),
      list(list("(", "1", "; 2)"), "(1 ; 2)"),
      list(list("some-symbol"), "some-symbol"),
      list(list("another_symbol"), "another_symbol"),
      list(list("(", "a", "(", "b", "c", ")", "d", ")"), "(a (b c) d)"),
      list(list("\"abc\""), "\"abc\""),
      list(list("\"\\n\""), "\"\\n\"")
    )

    expected_input_cases foreach(case,
      expected := case at(0)
      input := case at(1)
      assertEquals(expected, Reader tokenize(input))))
)
