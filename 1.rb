# Question 1 -- sortByStrings(s,t): Sort the letters in the
# string s by the order they occur in the string t.
# You can assume t will not have repetitive characters.
# For s = "weather" and t = "therapyw", the output should be
# sortByString(s, t) = "theeraw". For s = "good" and t = "odg",
# the output should be sortByString(s, t) = "oodg".
def sort_by_strings(s, t)
  s.chars.sort_by { |c| t.index(c) }.join
end

p sort_by_strings('weather', 'therapyw') === 'theeraw'
p sort_by_strings('good', 'odg') === 'oodg'
