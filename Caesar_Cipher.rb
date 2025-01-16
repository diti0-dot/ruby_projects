def caesar_cipher
  puts "Give a sentence"
  string = gets.chomp  

  puts "Give a number for shift"
  num = gets.chomp.to_i  

  puts "string: '#{string}' shift: #{num}"

  shifted = "" 

  string.each_char do |char|
    if char =~ /[A-Za-z]/
      if char =~ /[A-Z]/
        base = 65
      elsif char =~ /[a-z]/
        base = 97
      end
      shifted_char = ((char.ord - base + num) % 26 + base).chr
      shifted += shifted_char
    else
      shifted += char
    end  
  end

  puts "Shifted sentence: #{shifted}" 
end

caesar_cipher
