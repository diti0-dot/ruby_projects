dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "go"]
word = "go"
def find_word(word, dictionary)
    if dictionary.include?(word)
      puts "yesss!"
      count = dictionary.count(word)
      puts "#{word} : #{count}"
    else 
      puts "noo"
    end
end
puts find_word(word, dictionary)