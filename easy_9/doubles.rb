def double?(num)
  result = num.to_s.chars
  split = result.size / 2
  if result[0, split] == result[split, split] && num.to_s.size % 2 == 0
    return true
  else
    return false
  end
end

def twice(num)
  if double?(num)
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
