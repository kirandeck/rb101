DEGREE = "\xC2\xB0"

def dms(num)
  degrees, remainder = num.divmod(1)
  minutes = remainder * 60
  seconds = minutes % 1 * 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
print dms(76.73) 
p dms(254.6)
           dms(93.034773) == %(93°02'05")
           dms(0) == %(0°00'00")
           dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
