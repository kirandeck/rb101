def sequence(count, number)
  result = []
  multiple = number
  count.times do
    result << multiple
    multiple += number
  end
  result
end

p sequence(5, 1)
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
