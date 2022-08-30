def greetings(array, hash)
  name = array.join(' ')
  occupation = hash[:title] + " " + hash[:occupation]
  "Hello, #{name}! Nice to have a #{occupation} around."
end

p greetings(["John", "Q", "Doe"], { title: "Master", occupation: "Plumber" })
