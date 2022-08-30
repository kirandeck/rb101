words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

hash = {}
words.each do |word|
  key = word.chars.sort
  if hash.has_key?(key)
    hash[key] << word
  else
    hash[key] = [word]
  end
end
hash.each do |key, value|
  p value
end
