vowels = ["a", "e", "i", "o", "u", "y"]
hash_vowels = {}

("a".."z").each_with_index do |let, index| 
  if vowels.each { |x| x } == let  
    index += 1
    hash_vowels.store(let, index)
    puts hash_vowels
  end
end
