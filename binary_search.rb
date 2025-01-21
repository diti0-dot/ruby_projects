class Tree
  attr_accessor :root

  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array)
  end

  # Build a balanced tree recursively
  def build_tree(array)
    return nil if array.empty?

    mid = array.length / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid + 1..-1])

    root
  end

  # Pretty print the tree
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # Insert a value into the tree
  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    node
  end

  # Delete a value from the tree
  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      min_larger_node = find_min(node.right)
      node.data = min_larger_node.data
      node.right = delete(min_larger_node.data, node.right)
    end
    node
  end

  def find_min(node)
    node = node.left while node.left
    node
  end

  # Find a node with the given value
  def find(value, node = @root)
    return nil if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      node
    end
  end

  # Level-order traversal
  def level_order(node = @root, &block)
    queue = [node]
    result = []
    until queue.empty?
      current = queue.shift
      result << current.data
      block.call(current) if block_given?
      queue << current.left if current.left
      queue << current.right if current.right
    end
    result
  end

  # Depth-first traversals
  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left, result, &block)
    block.call(node) if block_given?
    result << node.data
    inorder(node.right, result, &block)
    result
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    block.call(node) if block_given?
    result << node.data
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)
    result
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    block.call(node) if block_given?
    result << node.data
    result
  end

  # Height of a node
  def height(node)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    [left_height, right_height].max + 1
  end

  # Depth of a node
  def depth(node, current = @root, edges = 0)
    return edges if node == current
    return -1 if current.nil?

    if node.data < current.data
      depth(node, current.left, edges + 1)
    else
      depth(node, current.right, edges + 1)
    end
  end

  # Check if the tree is balanced
  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    (left_height - right_height).abs <= 1 &&
      balanced?(node.left) &&
      balanced?(node.right)
  end

  # Rebalance the tree
  def rebalance
    values = inorder
    @root = build_tree(values)
  end
end
