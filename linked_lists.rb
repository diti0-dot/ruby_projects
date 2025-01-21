class LinkedList
    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end
  
    def append(value)
      new_node = Node.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        @tail.next_node = new_node
        @tail = new_node
      end
      @size += 1
    end
  
    def prepend(value)
      new_node = Node.new(value, @head)
      @head = new_node
      @tail = new_node if @head.nil?
      @size += 1
    end
  
    def size
      @size
    end
  
    def head
      @head
    end
  
    def tail
      @tail
    end
  
    def at(index)
      return nil if index < 0 || index >= @size
  
      current_node = @head
      index.times do
        current_node = current_node.next_node
      end
      current_node
    end
  
    def pop
      return nil if @size == 0
  
      if @size == 1
        @head = @tail = nil
      else
        current_node = @head
        while current_node.next_node != @tail
          current_node = current_node.next_node
        end
        current_node.next_node = nil
        @tail = current_node
      end
  
      @size -= 1
    end
  
    def contains?(value)
      current_node = @head
      while current_node != nil
        return true if current_node.value == value
        current_node = current_node.next_node
      end
      false
    end
  
    def find(value)
      current_node = @head
      index = 0
      while current_node != nil
        return index if current_node.value == value
        current_node = current_node.next_node
        index += 1
      end
      nil
    end
  
    def to_s
      current_node = @head
      output = ''
      while current_node != nil
        output += current_node.value
        output += ' -> ' if current_node.next_node != nil
        current_node = current_node.next_node
      end
      output
    end
  end
  
  class Node
    attr_accessor :value, :next_node
  
    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end
  
  list = LinkedList.new
  list.append('dog')
  list.append('cat')
  list.append('parrot')
  list.append('hamster')
  list.append('snake')
  list.append('turtle')
  
  puts list.to_s  
  
