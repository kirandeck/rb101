# understand the problem:
 # input: integer
 # output: string
 # based on integer, string represents time of day in 24h style
  # 1440 minutes in a day

# Examples/test cases:
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Data structures:
#  output is relative to minutes before or after midnight
#  1. user inputs integer into a method
#  2. method takes integer and compares it to 00:00
#  3. method outputs time of date
#  4. time of day gets formatted to a string with "00:00" style

# Algorithims:
#  1440 minutes = 1 day
#  0 = midnight
#  1440 minutes is a full cycle back to 0
  
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

def after_midnight(string)
  if string == '00:00' || string == '24:00'
    return total_minutes = 0
  end
  
  string.delete! ':'
  
  hours = string[0, 2].to_i
  remainder = string[2, 2].to_i
  total_minutes = hours * MINUTES_PER_HOUR + remainder
  total_minutes
end

def before_midnight(string)
  if string == '00:00' || string == '24:00'
    return total_minutes = 0
  end
  
  string.delete! ':'
  
  if string[2, 2] != '00'
    hours = string[0, 2].to_i - 1
  else
    hours = string[0, 2].to_i
  end
  
  remainder = MINUTES_PER_HOUR - string[2, 2].to_i
  total_minutes = hours * MINUTES_PER_HOUR + remainder
  total_minutes
end

p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00')
p before_midnight('24:00')
