def print_in_box(string)
  horizontal = "+" + "-" * (string.size + 2) + "+"
  vertical = '|' + " " * (string.size + 2) + '|'
  puts horizontal
  puts vertical
  puts "| " + string + " |"
  puts vertical
  puts horizontal
end

print_in_box('To go boldy where no one has gone before')
