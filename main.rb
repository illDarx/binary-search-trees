class Tree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def place(value)
    new_node = Node.new(value)
    if @root == nil
      @root = new_node
      return @root
    end
    current = @root
    until current == nil do
      if value < current.value
parent = current
current = current.left_child
        left = true
      else
        parent = current
        current = current.right_child
        left = false
      end
    end
    new_node.parent = parent
    if left == true
      parent.left_child = new_node
    else
      parent.right_child = new_node
    end
    return new_node
  end

  def build_tree(array)
    array.each do |i|
      place(i)
    end
  end

  def breadth_first_search(value)
    address_book = []
    current = @root
    until current == nil
      address_book << current.left_child unless current.left_child == nil
      address_book << current.right_child unless current.right_child == nil
      if current.value == value
        return current.value
      end
      current = address_book.shift()
    end
    return nil
  end

  def depth_first_search(value)
    address_book = []
    current = @root
    until current == nil
      address_book << current.right_child unless current.right_child == nil
      address_book << current.left_child unless current.left_child == nil
      if current.value == value
        return current.value
      end
      current = address_book.pop()
    end
    return nil
  end

  def dfs_rec(root, value)
    if root == nil
      return nil
    elsif root.value == value
      return value
    elsif value < root.value
      dfs_rec(root.left_child, value)
    else
      dfs_rec(root.right_child, value)
    end
end
end

class Node
  attr_accessor :value, :parent, :left_child, :right_child
  def initialize(value)
    @value = value
    @parent = nil
    @left_child = nil
    @right_child = nil
  end
end

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new
tree.build_tree(data)

tree.depth_first_search(6345)
