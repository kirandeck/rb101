def staggered_case(string)
  result = ''
  need_upper = true
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  string.chars.each do |char|
    if need_upper && letters.include?(char)
      result << char.capitalize
      need_upper = !need_upper
    elsif letters.include?(char)
      result << char.downcase
      need_upper = !need_upper
    else
      result << char
    end
  end
  result
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
