class Node
    attr_accessor :key, :value, :next
  
    def initialize(key, value, next_node = nil)
      @key = key
      @value = value
      @next = next_node
    end
  end
  
  class HashMap
    def initialize(capacity = 16, load_factor = 0.75)
      @capacity = capacity
      @load_factor = load_factor
      @size = 0
      @buckets = Array.new(capacity)
    end
  
    def hash(key)
      hash_code = 0
      prime_number = 31
      key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      hash_code
    end
  
    def set(key, value)
      resize if @size >= @capacity * @load_factor
  
      index = hash(key) % @capacity
      node = @buckets[index]
      while node
        if node.key == key
          node.value = value
          return
        end
        node = node.next
      end
      @size += 1
      new_node = Node.new(key, value)
      new_node.next = @buckets[index]
      @buckets[index] = new_node
    end
  
    def get(key)
      index = hash(key) % @capacity
      node = @buckets[index]
      while node
        return node.value if node.key == key
        node = node.next
      end
      nil
    end
  
    def has?(key)
      index = hash(key) % @capacity
      node = @buckets[index]
      while node
        return true if node.key == key
        node = node.next
      end
      false
    end
  
    def delete(key)
      index = hash(key) % @capacity
      node = @buckets[index]
      prev = nil
  
      while node
        if node.key == key
          if prev
            prev.next = node.next
          else
            @buckets[index] = node.next
          end
          @size -= 1
          return
        end
        prev = node
        node = node.next
      end
    end
  
    def length
      @size
    end
  
    def clear
      @buckets = Array.new(@capacity)
      @size = 0
    end
  
    def keys
      keys = []
      @buckets.each do |node|
        while node
          keys << node.key
          node = node.next
        end
      end
      keys
    end
  
    def values
      values = []
      @buckets.each do |node|
        while node
          values << node.value
          node = node.next
        end
      end
      values
    end
  
    def entries
      entries = []
      @buckets.each do |node|
        while node
          entries << [node.key, node.value]
          node = node.next
        end
      end
      entries
    end
  
    def resize
      return unless @size >= @capacity * @load_factor
  
      new_capacity = @capacity * 2
      new_buckets = Array.new(new_capacity)
  
      @buckets.each do |node|
        while node
          new_index = hash(node.key) % new_capacity
          new_node = Node.new(node.key, node.value)
          new_node.next = new_buckets[new_index]
          new_buckets[new_index] = new_node
          node = node.next
        end
      end
  
      @capacity = new_capacity
      @buckets = new_buckets
    end
  end
  
  test = HashMap.new
  test.set('apple', 'red')
  test.set('banana', 'yellow')
  test.set('carrot', 'orange')
  test.set('dog', 'brown')
  test.set('elephant', 'gray')
  test.set('frog', 'green')
  test.set('grape', 'purple')
  test.set('hat', 'black')
  test.set('ice cream', 'white')
  test.set('jacket', 'blue')
  test.set('kite', 'pink')
  test.set('lion', 'golden')
  test.set('moon', 'silver')

  
  puts test.entries.inspect  

  
  
