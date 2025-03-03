require_relative 'Node'
require 'set'
$file_handler = Set.new

class BST
  attr_accessor :root_node

  def initialize
    @root_node = root_node
  end

  def insert_node(data)
    $file_handler.add(data)
    if @root_node.nil?
      @root_node = Node.new(data)
    else
      current_node = @root_node
      
      loop do
        if current_node.nil?
          current_node = Node.new(data)
          break
        end

        if current_node.data < data
          if current_node.next_pointer.nil?
            current_node.next_pointer = Node.new(data)
            break
          else
            current_node = current_node.next_pointer
            next
          end
        end

        if current_node.data > data
          if current_node.prev_pointer.nil?
            current_node.prev_pointer = Node.new(data)
            break
          else
            current_node = current_node.prev_pointer
            next
          end
        end

        if current_node.data == data
          puts "Element already exists"
          break
        end
      end
    end
  end

  def inorder_traversal(temp_root = @root_node)
    return if temp_root.nil?
    inorder_traversal(temp_root.prev_pointer)
    puts(temp_root.data)
    inorder_traversal(temp_root.next_pointer)
  end

  def preorder_traversal(temp_root = @root_node)
    return if temp_root.nil?
    puts(temp_root.data)
    preorder_traversal(temp_root.prev_pointer)
    preorder_traversal(temp_root.next_pointer)
  end

  def postorder_traversal(temp_root = @root_node)
    return if temp_root.nil?
    postorder_traversal(temp_root.prev_pointer)
    postorder_traversal(temp_root.next_pointer)
    puts(temp_root.data)
  end

  def find_maximum
    if @root_node.nil?
      puts "Tree is empty"
      return
    end
    max_node = @root_node
    while !max_node.next_pointer.nil?
      max_node = max_node.next_pointer
    end
    puts max_node.data
  end

  def find_minimum
    if @root_node.nil?
      puts "Tree is empty"
      return
    end
    min_node = @root_node
    while !min_node.prev_pointer.nil?
      min_node = min_node.prev_pointer
    end
    puts min_node.data
  end

  def search_element(element)
    search_node = @root_node
    puts @root_node.data
    if !search_node.nil? && search_node.data == element
      puts "Element exists"
      return
    end

    while !search_node.nil?
      if search_node.data < element
        search_node = search_node.next_pointer
      elsif  search_node.data > element
        search_node = search_node.prev_pointer
      end

      if search_node.data == element
        puts "Element exists"
        return
      end
    end

    puts "Element does not exist"
  end

  def levelorder_traversal
    traverse_queue = Queue.new
    traverse_queue.push(@root_node)
    
    while !traverse_queue.empty?
      current_node = traverse_queue.pop
      if !current_node.nil?
        puts current_node.data
        if !current_node.prev_pointer.nil?
         traverse_queue.push(current_node.prev_pointer)
        end

        if !current_node.next_pointer.nil?
         traverse_queue.push(current_node.next_pointer)
        end
      end
    end
  end    

  def print_paths(root_node, track_path = [])
    return if root_node.nil?
    duplicate = track_path.dup
    duplicate.append(root_node.data)
    print_paths(root_node.prev_pointer, duplicate)
    print_paths(root_node.next_pointer, duplicate)
    
    if root_node.prev_pointer.nil? && root_node.next_pointer.nil?
      duplicate.each do |iterator|
        puts iterator
      end
      duplicate = []
      puts "---"
    end
  end

  def delete_node(root_node = @root_node, delete_element)
    $file_handler.delete?(delete_element)
    return if root_node.nil?
    if root_node.data > delete_element
      root_node.prev_pointer = delete_node(root_node.prev_pointer, delete_element)
    elsif root_node.data < delete_element
      root_node.next_pointer = delete_node(root_node.next_pointer, delete_element)
    else
      if root_node.prev_pointer.nil?
        return root_node.next_pointer
      end

      if root_node.next_pointer.nil?
        return root_node.prev_pointer
      end

      successor_node = get_successor(root_node)
      root_node.data = successor_node.data
      root_node.next_pointer = delete_node(root_node.next_pointer, successor_node.data)
    end

    return root_node
  end

  def get_successor(root_node)
    root_node = root_node.next_pointer
    while !root_node.nil? && !root_node.prev_pointer.nil?
      root_node = root_node.prev_pointer
    end
    return root_node
  end
end

object = BST.new()
puts "Enter the file name you want to work with"
file = gets.chomp

if File.exist?(file)
  open_file = File.open(file, "r")
  if !File.empty?(file)
    open_file.each_line do |iterator|
      object.insert_node(iterator.to_i)
    end
  end
else 
  open_file = File.new(file, "w+")
end

$file_handler.each do |iterator|
  puts iterator
end

loop do
  puts "1.Insert\n2.Inorder\n3.Preorder\n4.Postorder\n5.Levelorder\n6.Search\n7.Max_Element\n"\
       "8.Min_Element\n9.Delete\n10.Print_All_Paths\n11.Quit\n"
  input = gets.to_i
  case input
  when 1
    new_element = gets.to_i
    object.insert_node(new_element)
    puts "---"
  when 2
    object.inorder_traversal
    puts "---"
  when 3
    object.preorder_traversal
    puts "---"
  when 4
    object.postorder_traversal
    puts "---"
  when 5
    object.levelorder_traversal
    puts "---"
  when 6
    puts "Enter the value"
    search_element = gets.to_i
    object.search_element(search_element)
    puts "---"
  when 7
    object.find_maximum
    puts "---"
  when 8
    object.find_minimum
    puts "---"
  when 9
    del_node = gets.to_i
    object.delete_node(object.root_node, del_node)
    puts "---"
  when 10
    object.print_paths(object.root_node)
    puts "---"
  when 11
    break
  else
    puts "Enter a valid input"
  end
end

File.delete(file)
open_file = File.new(file, 'w')
$file_handler.each do |iterator|
  open_file.syswrite(iterator.to_s + "\n")
end
open_file.close()
