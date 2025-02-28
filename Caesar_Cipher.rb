

def caesar_cipher(word = "Cat", key = 5)
      splitted = word.split("")
      
      result = ""
      
      
      splitted.each do |i| 
        if i == i.upcase 
       
         result += ( (i.ord + key - 65)%26+65).chr
          
        elsif i == i.downcase
          result+= ((i.ord  + key - 97)%26+97).chr
         
        else 
          puts "idk"
           result += i
        end 
       end 
       
        puts "original: #{word}"
        puts "caesar version:" + result 
      
end 

caesar_cipher
