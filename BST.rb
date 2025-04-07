# bst.rb

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class BST
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(values)
    values = values.split(',').map(&:strip).map(&:to_i) if values.is_a?(String)
    values = [values] unless values.is_a?(Array)

    values.each { |val| @root = insert_node(@root, val) }
    puts "Data inserted successfully"
  end

  def search(val)
    node = @root
    while node
      return true if val == node.val
      node = val < node.val ? node.left : node.right
    end
    false
  end

  def find_min
    return nil unless @root

    min_node = find_min_node(@root)
    puts "Minimum value node is: #{min_node.val}"
  end

  def find_max
    return nil unless @root

    max_node = find_max_node(@root)
    puts "Maximum value node is: #{max_node.val}"
  end

  def inorder
    puts "Tree is empty" and return unless @root
    puts "Inorder Traversal:"
    inorder_traversal
    puts
  end

  def preorder
    puts "Tree is empty" and return unless @root
    puts "Preorder Traversal:"
    preorder_traversal
    puts
  end

  def postorder
    puts "Tree is empty" and return unless @root
    puts "Postorder Traversal:"
    postorder_traversal
    puts
  end

  def level_order_traversal(node = @root)
    puts "Tree is empty" and return unless node

    queue = [node]
    until queue.empty?
      curr = queue.shift
      print "#{curr.val} "
      queue.push(curr.left) if curr.left
      queue.push(curr.right) if curr.right
    end
    puts
  end

  def delete(val)
    puts "Tree is empty" and return unless @root
    unless search(val)
      puts "Value not found in the tree"
      return
    end
    @root = delete_node(@root, val)
    puts "Value deleted successfully"
  end

  def print_path
    puts "Tree is empty" and return unless @root
    puts "Root to leaf paths:"
    root_to_leaf_path(@root)
    puts
  end

  private

  def insert_node(node, val)
    return TreeNode.new(val) unless node

    if val < node.val
      node.left = insert_node(node.left, val)
    elsif val > node.val
      node.right = insert_node(node.right, val)
    end
    node
  end

  def delete_node(node, val)
    return nil unless node

    if val < node.val
      node.left = delete_node(node.left, val)
    elsif val > node.val
      node.right = delete_node(node.right, val)
    else
      return node.right unless node.left
      return node.left unless node.right

      min_node = find_min_node(node.right)
      node.val = min_node.val
      node.right = delete_node(node.right, min_node.val)
    end
    node
  end

  def find_min_node(node)
    node = node.left while node.left
    node
  end

  def find_max_node(node)
    node = node.right while node.right
    node
  end

  def inorder_traversal(node = @root)
    return unless node
    inorder_traversal(node.left)
    print "#{node.val} "
    inorder_traversal(node.right)
  end

  def preorder_traversal(node = @root)
    return unless node
    print "#{node.val} "
    preorder_traversal(node.left)
    preorder_traversal(node.right)
  end

  def postorder_traversal(node = @root)
    return unless node
    postorder_traversal(node.left)
    postorder_traversal(node.right)
    print "#{node.val} "
  end

  def root_to_leaf_path(node = @root, path = [])
    return unless node

    path << node.val

    if !node.left && !node.right
      puts path.join(' ')
      puts
    else
      root_to_leaf_path(node.left, path)
      root_to_leaf_path(node.right, path)
    end
    path.pop
  end
end
