def minilang(string)
  stack = []
  register = 0
  string.split.each do |el|
    case el
    when "PUSH" then
    when "ADD" then
    when "SUB" then
    when "MULT" then
    when "DIV" then
    when "MOD" then
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    else
      register = el.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

 minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

 minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

 minilang('-3 PUSH 5 SUB PRINT')
# 8

 minilang('6 PUSH')
# (nothing printed; no PRINT commands)
