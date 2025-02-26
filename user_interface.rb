require_relative 'BST.rb'
require_relative 'LinkedList.rb'

def linked_list(list_object)
  loop do
    puts "1.Insert_AtBeginning\n2.Insert_AtEnd\n3.Insert_AtPos\n4.Delete_Beginning\n5.Delete_AtEnd\n"\
         "6.Display\n7.Reverse_list\n8.display_reverse\n9.Search\n10.Exit\n"
    choice = gets.chomp.to_i
    flag = 1
    case choice
    when 1
      puts "Enter the value"
      data = gets.chomp.to_i
      puts "--------------"
      list_object.insert_head(data)
      puts "--------------"
    when 2
      puts "Enter the value"
      data = gets.chomp.to_i
      puts "--------------"
      list_object.insert_end(data)
      puts "--------------"
    when 3
      puts "Enter the value"
      data = gets.chomp.to_i
      puts "Enter the position"
      pos = gets.chomp.to_i
      puts "--------------"
      list_object.insert_position(data, pos)
      puts "--------------"
    when 4
      puts "--------------"
      list_object.delete_head
      puts "--------------"
    when 5
      puts "--------------"
      list_object.delete_end
      puts "--------------"
    when 6
      puts "--------------"
      list_object.display
      puts "--------------"
    when 7
      puts "--------------"
      list_object.reverse_list
      puts "--------------"
    when 8
      puts "--------------"
      list_object.display_reverse
      puts "--------------"
    when 9
      puts "Enter the element"
      search_object = gets.chomp.to_i
      list_object.search_element(search_object)
    when 10
      break
    else
      puts "Please Enter a valid option"
    end
  end
end

def binary_search_tree(flag, bst_obj, file)
  if flag == 0
    puts "Enter the file name you want to work with"
    file = gets.chomp
  end
  
  if File.exist?(file)
    open_file = File.open(file, "r+")
    open_file.each_line do |iterator|
      bst_obj.insert_node(iterator.to_i)
    end
  else
    open_file = File.new(file, "w")
  end

  flag = 1

  loop do
    puts "1.Insert\n2.Inorder\n3.Preorder\n4.Postorder\n5.Levelorder\n6.Search\n7.Max_Element\n"\
         "8.Min_Element\n9.Delete\n10.Print_All_Paths\n11.Quit\n"
    choice = gets.chomp.to_i
    case choice
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
    when 7
      bst_obj.find_maximum
      puts "---"
    when 8
      bst_obj.find_minimum
      puts "---"
    when 9
      del_node = gets.chomp.to_i
      bst_obj.delete_node(bst_obj.root_node, del_node)
      puts "---"
    when 10
      bst_obj.print_paths(bst_obj.root_node)
      puts "---"
    when 11
      File.delete(file)
      open_file = File.new(file, 'w')
      $file_handler.each do |iterator|
        open_file.syswrite(iterator.to_s + "\n")
      end
      open_file.close()
      break
    else
      puts "Enter a valid option"
    end
  end
end

flag = 0
file_open = nil
list_object = LinkedList.new()
bst_obj = BST.new()

loop do
  puts 'Which Data structure you like to work with'
  puts '1.Linked List 2. Binary Search Tree 3.Quit'
  choice = gets.chomp.to_i
  case choice
  when 1
    linked_list(list_object)
  when 2
    binary_search_tree(flag, bst_obj, file_open)
  when 3
    break
  else 
    puts 'Enter a valid choice'
    next
  end  
end

