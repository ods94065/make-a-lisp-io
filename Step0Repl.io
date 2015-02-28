makeStub := method(
  method(x,x))
Repl := Object clone
Repl read_ := makeStub
Repl eval_ := makeStub
Repl print_ := makeStub
Repl rep := method(input, print_(eval_(read_(input))))
Repl main := method(
  inFile := File standardInput
  outFile := File standardOutput
  loop(
    outFile write("mal> ")
    outFile flush
    input := inFile readLine
    (input == nil) ifTrue(
      outFile write("\n")
      outFile flush
      break)
    result := rep(input)
    outFile write(result, "\n")))

repl := Repl clone
repl main
