require_relative 'BST.rb'
require_relative 'LinkedList.rb'
flag = 0
file_open = nil
list_object = LinkedList.new()
create_bst = BST.new()
loop do
  puts 'Which Data structure you like to work with'
  puts '1.Linked List 2. Binary Search Tree 3.Quit'
  choice = gets.chomp.to_i
   case choice
   when 1
     loop do
       puts "1.Insert_AtBeginning\n2.Insert_AtEnd\n3.Insert_AtPos\n4.Delete_Beginning\n5.Delete_AtEnd\n"
       puts "6.Display\n7.Reverse_list\n8.display_reverse\n9.Search\n10.Exit\n"
       choice  = gets.chomp.to_i
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
         list_object.insert_position(data,pos)
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
   when 2
     if flag == 0
       puts "Enter the file name you want to work with"
       file_open = gets
     end
     if  File.exist?(file_open)
       open_file = File.open(file_open,"r+")
       open_file.each_line do |iterator|
       create_bst.insert_node(iterator.to_i)
       end
     else
       open_file  =  File.new(file_open,"w+")
     end
       flag = 1
     loop do
       puts "1.Insert\n2.Inorder\n3.Preorder\n4.Postorder\n5.Levelorder\n6.Search\n7.Max_Element\n"
       puts "8.Min_Element\n9.Delete\n10.Print_All_Paths\n11.Quit\n"
       loop_var = gets.chomp.to_i
       case loop_var
       when 1
         new_element = gets.chomp.to_i
         create_bst.insert_node(new_element)
         puts "---"
       when 2
         create_bst.inorder_traversal
         puts "---"
       when 3
         create_bst.preorder_traversal
         puts "---"
       when 4
         create_bst.postorder_traversal
         puts "---"
       when 5
         create_bst.levelorder_traversal
         puts "---"
       when 6
         puts "Enter the value"
         search_element = gets.chomp.to_i
         create_bst.search_element(search_element)
         puts "---"
       when 7
         create_bst.find_maximum
         puts "---"
       when 8
         create_bst.find_minimum
         puts "---"
       when 9
         del_node = gets.chomp.to_i
         create_bst.delete_node(create_bst.root_node,del_node)
         puts "---"
       when 10
         create_bst.print_paths(create_bst.root_node)
         puts "---"
       when 11
        $file_handler.each do|iterator|
        open_file.syswrite(iterator.to_s + "\n")
        end
        break            
       end
     end 
   when 3
     break
   else 
     puts 'Enter a valid choice'
     next
   end  
 end

