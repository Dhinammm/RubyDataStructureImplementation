class Node
  attr_accessor :data, :next_pointer ,:prev_pointer

  def initialize(data_part)
    @prev_pointer = nil
    @data = data_part
    @next_pointer = nil
  end
end

