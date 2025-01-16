def find_the_word(word, dictionary)
  len = word.length
  
  (0...len).each do |i| 
    (i+1..len).each do |j| 
      substring = word[i, j-i]  # Corrected slicing
      if dictionary.include?(substring)
        puts "'#{substring}' is found in the dictionary!"
      end
    end
  end
end   


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
find_the_word("below",dictionary )
