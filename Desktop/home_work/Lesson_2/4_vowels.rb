vowels = ["a", "e", "i", "o", "u", "y"]
hash_vowels = { }
i = 0

for n in "a".."z" do
  i += 1
  vowels.each do |m|
    if n == m
    hash_vowels[n] = i 
    end
  end
end

hash_vowels.each do |j|
  print j
end
