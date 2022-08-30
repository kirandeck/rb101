def multisum(num)
  new = []
  
  for i in (1..num)
    if i % 3 == 0 || i % 5 == 0
      new << i
    end
  end
  
  sum = 0
  
  new.each do |num1|
    sum = sum + num1
  end
  
  sum
end

p multisum(10)
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
