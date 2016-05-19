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

function getproblem(problem::Int, pair::Int, shifts::Int)
    infile = open("./coded_problem_$problem.txt", "r")
    codedproblem = readall(infile)
    close(infile)
    uncodedproblem = decode(pair, shifts, codedproblem)
    outfile = open("./uncoded_problem_$problem.jl", "w")
    write(outfile, uncodedproblem)
    close(outfile)
end

function codeproblem(problem::Int, pair::Int, shifts::Int)
    infile = open("./uncoded_problem_$problem.jl", "r")
    uncodedproblem = readall(infile)
    close(infile)
    outfile = open("./coded_problem_$problem.txt", "w")
    codedproblem = code(pair, shifts, uncodedproblem)
    write(outfile, codedproblem)
    close(outfile)
end
