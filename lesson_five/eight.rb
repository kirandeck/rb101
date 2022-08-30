hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ['a', 'e', 'i', 'o', 'u']

hsh.each do |key, details|
  details.each do |string|
    letters = string.chars
    letters.each do |letter|
        if vowels.include?(letter)
          p letter
        end
    end
  end
end
