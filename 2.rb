# Question 2 -- decodeString(s): Given an encoded string,
# return its corresponding decoded string.
# The encoding rule is: k[encoded_string], where the encoded_string inside
# the square brackets is repeated exactly k times.
# Note: k is guaranteed to be a positive integer.
# For s = "4[ab]", the output should be decodeString(s) = "abababab"
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

def decode_string(s)
  return [s] if s.match(/\[/).nil?
  /(?<last>\w+)?(?<k>\d)\[(?<code>.*)\]/ =~ s
  [last].push(decode_string(code) * k.to_i).join
end

p decode_string('4[ab]') === "abababab"
p decode_string('2[b3[a]]') === "baaabaaa"
p decode_string('2[b3[a4[ab]]]') === "baababababaababababaababababbaababababaababababaabababab"
