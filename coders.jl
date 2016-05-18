function code(pair::Int, shifts::Int, text)
  newtext = ""
  for character in text
    newcharacter = (Int(character) << shifts) $ pair
    newtext = "$newtext$(Char(newcharacter))"
  end
  return newtext
end

function decode(pair::Int, shifts::Int, text)
  newtext = ""
  for character in text
    newcharacter = (Int(character) $ pair) >> shifts
    newtext = "$newtext$(Char(newcharacter))"
  end
  return newtext
end

outfile = open("./example.txt", "w")
qwe = code(123,2,"asd")
write(outfile,qwe)
close(outfile)

infile = open("./example.txt", "r")
decode(123,2,readall(infile))
