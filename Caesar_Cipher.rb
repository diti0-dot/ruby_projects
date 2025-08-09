
sentence = ""
shift = 0
 puts "Sentence: "
  sentence = gets.chomp
  puts "Shift: "
  shift = gets.chomp 
  num = shift.to_i
  alpha = 'a'..'z' 

def caesar(sentence, num)
  results =""
  for char in sentence.chars
    if char.match(/[a-z]/)
      con = char.ord
      add_alp = (con - 'a'.ord + num) % 26 + 'a'.ord 
      new_alp = add_alp.chr 
      results << new_alp
    elsif char.match(/[A-Z]/)
      con = char.ord
      add_alp = (con - 'A'.ord + num) % 26 + 'A'.ord 
      new_alp = add_alp.chr 
      results <<  new_alp
    else
        results << char 
    end 
  end
  return results
end
neww = caesar(sentence, num)
puts "Encrypted: #{neww}"