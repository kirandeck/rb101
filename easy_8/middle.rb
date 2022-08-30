def center_of(string)
  if string.length.odd?
    center = string.length / 2
    string[center]
  else
    center = string.length / 2 - 1
    string[center, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
