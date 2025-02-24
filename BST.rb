require_relative 'TreeNode'
require 'set'
$file_handler = Set.new

class BST
  attr_accessor :root_node

  def initialize
    @root_node = root_node
  end

  def insert_node(data_part)
    if @root_node.nil?
      @root_node = TreeNode.new(data_part)
    else
      current_node = @root_node
      loop do
        if current_node.nil?
          current_node = TreeNode.new(data_part)
          $file_handler.add(data_part)
          break
        end
        if current_node.data < data_part
          if current_node.right_child.nil?
            current_node.right_child = TreeNode.new(data_part)
            $file_handler.add(data_part)
            break
          else
            current_node = current_node.right_child
            next
          end
        end
        if current_node.data > data_part
          if current_node.left_child.nil?
            current_node.left_child = TreeNode.new(data_part)
            $file_handler.add(data_part)
            break
          else
            current_node = current_node.left_child
            next
          end
        end
      break
      end
    end
  end

  def inorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    inorder_traversal(temp_root.left_child)
    puts(temp_root.data)
    inorder_traversal(temp_root.right_child)
  end

  def preorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    puts(temp_root.data)
    preorder_traversal(temp_root.left_child)
    preorder_traversal(temp_root.right_child)
  end

  def postorder_traversal(temp_root = @root_node)
    if temp_root.nil?
      return
    end
    postorder_traversal(temp_root.left_child)
    postorder_traversal(temp_root.right_child)
    puts(temp_root.data)
  end

  def find_maximum
    max_node = @root_node
    while !max_node.right_child.nil?
      max_node = max_node.right_child
    end
    puts max_node.data
  end

  def find_minimum
    min_node = @root_node
    while !min_node.left_child.nil?
      min_node = min_node.left_child
    end
    puts min_node.data
  end

  def search_element(element)
    search_node=@root_node
    puts @root_node.data
    if !search_node.nil? and search_node.data == element
      puts "Element exists"
      return
    end
    while !search_node.nil?
      if search_node.data < element
        search_node = search_node.right_child
      elsif  search_node.data > element
        search_node = search_node.left_child
      end
      if search_node.data == element
        puts "Element exists"
        return
      end
    end
    puts "Element does not exist"
  end

  def levelorder_traversal
    traverse_queue=Queue.new
    traverse_queue.push(@root_node)
    while !traverse_queue.empty?
      current_node = traverse_queue.pop
      if !current_node.nil?
        puts current_node.data
        if !current_node.left_child.nil?
         traverse_queue.push(current_node.left_child)
        end
        if !current_node.right_child.nil?
         traverse_queue.push(current_node.right_child)
        end
      end
    end
  end    

  def print_paths(root_node, track_path = [])
    duplicate = track_path.dup
    if root_node.nil?
      return
    end
    duplicate.append(root_node.data)
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
    if root_node.data > delete_element
      root_node.left_child = delete_node(root_node.left_child,delete_element)
    elsif root_node.data < delete_element
      root_node.right_child = delete_node(root_node.right_child,delete_element)
    else
      if root_node.left_child.nil?
        return root_node.right_child
      end
      if root_node.right_child.nil?
        return root_node.left_child
      end
      successor_node = get_successor(root_node)
      root_node.data = successor_node.data
      root_node.right_child = delete_node(root_node.right_child, successor_node.data)
    end
    return root_node
  end

  def get_successor(root_node)
    root_node = root_node.right_child
    while !root_node.nil? and !root_node.left_child.nil?
      root_node = root_node.left_child
    end
    return root_node
  end
end
bst_obj = BST.new()
if  File.exist?("BST.txt")
  open_file = File.open("BST.txt","r+")
  open_file.each_line do |iterator|
    bst_obj.insert_node(iterator.to_i)
  end
else 
 open_file  =  File.new("BST.txt","w+")
end

loop do
  puts "1.Insert\n2.Inorder\n3.Preorder\n4.Postorder\n5.Levelorder\n6.Search\n7.Max_Element\n"
  puts "8.Min_Element\n9.Delete\n10.Print_All_Paths\n11.Quit\n"
  loop_var = gets.chomp.to_i
  case loop_var
  when 1
    new_element = gets.chomp.to_i
    bst_obj.insert_node(new_element)
    puts "---"
  when 2
    bst_obj.inorder_traversal
    puts "---"
  when 3
    bst_obj.preorder_traversal
    puts "---"
  when 4
    bst_obj.postorder_traversal
    puts "---"
  when 5
    bst_obj.levelorder_traversal
    puts "---"
  when 6
    puts "Enter the value"
    search_element = gets.chomp.to_i
    bst_obj.search_element(search_element)
    puts "---"
  when 7
    bst_obj.find_maximum
    puts "---"
  when 8
    bst_obj.find_minimum
    puts "---"
  when 9
    del_node = gets.chomp.to_i
    bst_obj.delete_node(bst_obj.root_node,del_node)
    puts "---"
  when 10
    bst_obj.print_paths(bst_obj.root_node)
    puts "---"
  when 11
    break
  end
end


  $file_handler.each do|iterator|
    open_file.syswrite(iterator.to_s + "\n")
  end
  open_file.close()
