require_relative 'TreeNode'
$path_tracer = []
class BST
  attr_accessor :root_node
  def initialize
    @root_node=root_node
  end

  def insert_node(data_part)
    $path_tracer.push(data_part)
    if @root_node.nil?
      @root_node=TreeNode.new(data_part)
    else
      current_node=@root_node
      while true
        if current_node.nil?
          current_node=TreeNode.new(data_part)
          break
        end
        if current_node.data_part<data_part
          if current_node.right_child.nil?
           current_node.right_child=TreeNode.new(data_part)
            break
          else
          current_node=current_node.right_child
          next
          end
        end
        if current_node.data_part>data_part
          if current_node.left_child.nil?
            current_node.left_child=TreeNode.new(data_part)
            break
          else
          current_node=current_node.left_child
          next
          end
        end
      end
    end
  end

  def inorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    inorder_traversal(temp_root.left_child)
    puts(temp_root.data_part)
    inorder_traversal(temp_root.right_child)
  end

  def preorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    puts(temp_root.data_part)
    preorder_traversal(temp_root.left_child)
    preorder_traversal(temp_root.right_child)
  end

  def postorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    postorder_traversal(temp_root.left_child)
    postorder_traversal(temp_root.right_child)
    puts(temp_root.data_part)
  end

  def find_maximum
    n = @root_node
    while n.right_child != nil
      n = n.right_child
    end
    puts n.data_part
  end

  def find_minimum
    n=@root_node
    while n.left_child != nil
      n = n.left_child
    end
    puts n.data_part
  end

  def search_element(s_element)
    n=@root_node
    puts @root_node.data_part
    if n != nil and n.data_part == s_element
      puts "Element exists"
      return
    end
    while n != nil
      if n.data_part < s_element
        n = n.right_child
      elsif  n.data_part > s_element
        n = n.left_child
      end
      if n.data_part == s_element
        puts "Element exists"
        return
      end
    end
    puts "Element not exists"
  end

  def levelorder_traversal
    traverse_queue=Queue.new
    traverse_queue.push(@root_node)
    while !traverse_queue.empty?
      r = traverse_queue.pop
      if !r.nil?
        puts r.data_part
        if !r.left_child.nil?
         traverse_queue.push(r.left_child)
        end

        if !r.right_child.nil?
         traverse_queue.push(r.right_child)
        end
      end
    end
  end    

  def print_paths(root_node ,track_path = [])
    duplicate = track_path.dup
    if root_node.nil?
      return
    end
      duplicate.append(root_node.data_part)
      print_paths(root_node.left_child, duplicate)
      print_paths(root_node.right_child, duplicate)
      if root_node.left_child.nil? and root_node.right_child.nil?
        duplicate.each do|iterator|
          puts iterator
        end
        duplicate = []
        puts "---"
      end
    end

  def delete_node(root_node = @root_node, delete_element)
    if root_node.nil?
      return root_node
    end
    if root_node.data_part > delete_element
      root_node.left_child = delete_node(root_node.left_child,delete_element)
    elsif root_node.data_part < delete_element
      root_node.right_child = delete_node(root_node.right_child,delete_element)
    else
      if root_node.left_child.nil?
        return root_node.right_child
      end
      if root_node.right_child.nil?
        return root_node.left_child
      end
      successor_node = get_successor(root_node)
    root_node.data_part = successor_node.data_part
    root_node.right_child = delete_node(root_node.right_child,successor_node.data_part)

    end
    return root_node
  end 
  def get_successor(root_node)
    root_node = root_node.right_child
    while root_node != nil and !root_node.left_child.nil?
      root_node = root_node.left_child
    end
    return root_node
  end
end

b = []
create_bst = BST.new()




while true
  puts "1.Insert\n2.Inorder\n3.Preorder\n4.Postorder\n5.Levelorder\n6.Search\n7.Max_Element\n"
  puts "8.Min_Element\n 9.Delete\n 10.Print_All_Paths\n 11.Quit\n"
  case
  when 1
    a = gets.chomp.to_i
    create_bst.insert_node(a)
  when 2
    create_bst.inorder_traversal(create_bst.root_node)
  when 3
    create_bst.preorder_traversal(create_bst.root_node)
  when 4
    create_bst.postorder_traversal(create_bst.root_node)
  when 5
    create_bst.levelorder_traversal
  when 6
    puts "Enter the value"
    a=gets.chomp.to_i
    create_bst.search_element(a)
  when 7
    create_bst.find_maximum
  when 8
    create_bst.find_minimum
  when 9
    a=gets.chomp.to_i
    create_bst.delete_node(create_bst.root_node,a)
  when 10
    create_bst.print_paths(create_bst.root_node)
  when 11
    break
  end
end

