vowels = ["a", "e", "i", "o", "u", "y"]
hash_vowels = {}

("a".."z").each_with_index do |let, index| 
  if vowels.find { |x| x == let } == let  
    index += 1
    hash_vowels.store(let, index)
  end
end
puts hash_vowels
