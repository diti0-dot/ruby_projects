def bubble_sort(bubbles)
  len = bubbles.length
  swapped = true  
  
  while swapped
    swapped = false 
    (0...len-1).each do |j|
      current_ele = bubbles[j]
      next_ele = bubbles[j+1]

      if current_ele > next_ele
        
        bubbles[j] = next_ele
        bubbles[j+1] = current_ele
        swapped = true  
      end
    end
    len -= 1  
  end
  puts bubbles.inspect #inspect gives like an array output 
end

bubbles = [4, 3, 78, 2, 0, 2]
 bubble_sort(bubbles)



