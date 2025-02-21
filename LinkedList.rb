require_relative 'Node'

class LinkedList
  attr_accessor :head_node, :tail_node
  def initialize
    @head_node = nil
    @tail_node = nil
  end

  def insert_end(data_part)
    if @head_node.nil?
      @head_node = Node.new(data_part)
      @tail_node = @head_node
    else
      @tail_node.next_pointer = Node.new(data_part)
      @tail_node.next_pointer.prev_pointer = @tail_node
      @tail_node = @tail_node.next_pointer
    end
  end

  def insert_head(data_part)
    new_node = Node.new(data_part)
    if @head_node.nil?
      @head_node = new_node
      @tail_node = @head_node
    else
      new_node.next_pointer = @head_node
      @head_node.prev_pointer = new_node
      @head_node = new_node
    end
  end

  def insert_position(data_part,position)
    current_node = @head_node
    if position == 1
      if !head_node.nil?
        new_node = Node.new(data_part)
        new_node.next_pointer = @head_node 
        @head_node.prev_pointer = new_node
        @head_node = new_node
        return
      else
        @head_node = Node.new(data_part)
        return
      end
    end
    while position != 1
      if current_node.nil?
        puts "There does not exist a position you mentioned"
        return
      else
      current_node = current_node.next_pointer
      position -= 1
      end
    end
    new_node = Node.new(data_part)
    new_node.next_pointer = current_node
    new_node.prev_pointer = current_node.prev_pointer
    if new_node.prev_pointer.nil?
      'Do nothing'
    else
    new_node.prev_pointer.next_pointer = new_node
    end
    if current_node.nil?
      'Do nothing'
    else
    current_node.prev_pointer = new_node
    end
  end

  def delete_head
    if @head_node.nil?
      puts "There is no node to delete"
    else
      @head_node = @head_node.next_pointer
      if !@head_node.nil?
      @head_node.prev_pointer = nil
      end
    end
  end

  def delete_end
    if @tail_node.nil?
      puts 'hi'
    else
      @tail_node = @tail_node.prev_pointer
      @tail_node.next_pointer = nil
    end
  end

  def reverse_list
    temp_node = @tail_node
    @tail_node = @head_node
    @head_node = temp_node
    while !temp_node.nil?
      swapper = temp_node.prev_pointer
      temp_node.prev_pointer = temp_node.next_pointer
      temp_node.next_pointer = swapper
      temp_node = temp_node.next_pointer
    end
  end

  def display
    temp_node = @head_node
    while !temp_node.nil?
      puts temp_node.data_part
      temp_node = temp_node.next_pointer
    end
  end

  def display_reverse
    temp_node = @tail_node
    while !temp_node.nil?
      puts temp_node.data_part
      temp_node = temp_node.prev_pointer
    end
  end

  def search_element(search_data)
    search_node = @head_node
    while !search_node.nil?
      if search_node.data_part == search_data
        puts "Element present in the list"
        return
      end
      search_node = search_node.next_pointer
    end
    puts "Element Not found"
  end

end

list_object = LinkedList.new()
loop do
  puts "1.Insert_AtBeginning\n2.Insert_AtEnd\n3.Insert_AtPos\n4.Delete_Beginning\n5.Delete_AtEnd\n"
  puts "6.Display\n7.Reverse_list\n8.display_reverse\n9.Search\n10.Exit\n"
  choice  = gets.chomp.to_i
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
