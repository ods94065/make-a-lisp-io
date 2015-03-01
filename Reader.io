Reader := Object clone

Reader tokenRegex := Regex with(
  """^[\s,]* (
      ~@
    | [\[\]{}()'`~^@]
    | "(?:\\.|[^\\"])*"
    | ;.*
    | [^\s\[\]{}('"`,;)]*
  )"""
) extended

Reader tokenize := method(str,
  tokens := list()
  loop(
    (str isEmpty) ifTrue(break)
    m := tokenRegex matchesIn(str) next
    m ifNil (Exception raise("Illegal token: '" .. str .. "'"))
    str = str exclusiveSlice(m sizeInChars)
    tokens append(m at(1)))
  tokens)
