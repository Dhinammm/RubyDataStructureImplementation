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

