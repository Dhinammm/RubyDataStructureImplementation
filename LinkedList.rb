require_relative 'Node'
class LinkedList
  def initialize
    @head_node=nil
  end

  def insert(data_part)
    if @head_node.nil?
      @head_node=Node.new(data_part)
    else
      current_node=@head_node
      while current_node.next_pointer != nil
        current_node=current_node.next_pointer
      end
      current_node.next_pointer=Node.new(data_part)
  end
  end

  def display
    temp_node=@head_node
    while temp_node != nil
      puts temp_node.data_part
      temp_node=temp_node.next_pointer
    end
  end

end

l1=LinkedList.new()
l1.insert(5)
l1.insert(9)
l1.insert(11)
l1.insert(6)
l1.display


