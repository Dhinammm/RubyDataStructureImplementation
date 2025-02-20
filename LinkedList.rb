require_relative 'Node'
class LinkedList
  def initialize
    @head_node = nil
    @tail_node = nil
  end

  def insert_tail(data_part)
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
    n = Node.new(data_part)
    if @head_node.nil?
      @head_node = n
      @tail_node = n
    else
      n.next_pointer = @head_node
      @head_node.prev_pointer=n
      @head_node = n
    end
  end

  def insert_position(data_part,pos)
    current_node = @head_node
    while pos != 1
      if current_node.nil?
        puts "There does not exist a position you mentioned"
        return
      else
      current_node = current_node.next_pointer
      pos -= 1
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
      'do nothing'
    else
      @head_node = @head_node.next_pointer
      @head_node.prev_pointer = nil
    end
  end

  def delete_tail
    if @tail_node.nil?
      'Do nothing'
    else
      @tail_node = @tail_node.prev_pointer
      @tail_node.next_pointer = nil
    end
  end

  def reverse_list
    n = @tail_node
    @tail_node = @head_node
    @head_node = n
    while n != nil
      m = n.prev_pointer
      n.prev_pointer = n.next_pointer
      n.next_pointer = m
      n = n.next_pointer
    end
  end

  def display
    temp_node = @head_node
    while temp_node != nil
      puts temp_node.data_part
      temp_node = temp_node.next_pointer
    end
  end

  def display_reverse
    temp_node = @tail_node
    while temp_node != nil
      puts temp_node.data_part
      temp_node = temp_node.prev_pointer
    end
  end

  def search_element(search_data)
    n=@head_node
    while n != nil
      if n.data_part == search_data
        puts "Element present in the list"
        return
      end
      n = n.next_pointer
    end
    puts "Element Not found"
  end

end

l1=LinkedList.new()
while true
  puts "1.Insert_AtBeginning 2.Insert_AtEnd 3.Insert_AtPos 4.Delete_Beginning 5.Delete_AtEnd 
        6.Display 7.Reverse_list 8.display_reverse 9.Search 10.Exit"
  a = gets.chomp.to_i
  case a
  when 1
    puts "Enter the value"
    data = gets.chomp.to_i
    l1.insert_head(data)
  when 2
    puts "Enter the value"
    data = gets.chomp.to_i
    l1.insert_tail(data)
  when 3
    puts "Enter the value"
    data = gets.chomp.to_i
    puts "Enter the position"
    pos = gets.chomp.to_i
    l1.insert_position(data,pos)
  when 4
    l1.delete_head
  when 5
    l1.delete_tail
  when 6
    l1.display
  when 7
    l1.reverse_list
  when 8 
    l1.display_reverse
  when 9
    puts "Enter the element"
    b=gets.chomp.to_i
    l1.search_element(b)
  when 10
    break
  else
    puts "Please Enter a valid option"
  end
end
