def get_grade(score1, score2, score3)
  sum = score1 + score2 + score3
  divisor = 3
  average = sum / divisor
  if average >= 90
    "A"
  elsif average >= 80
    "B"
  elsif average >= 70
    "C"
  elsif average >= 60
    "D"
  else
    "F"
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95) == "D"
