LETTERS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }

def alphabetic_number_sort(array)
  words = array.map do |number|
    LETTERS[number]
  end
  result = words.sort.map do |word|
    LETTERS.key(word)
  end
  result
end

p alphabetic_number_sort((0..19).to_a)
