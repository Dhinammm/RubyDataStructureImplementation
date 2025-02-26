class Node
  attr_accessor :data, :next_pointer ,:prev_pointer

  def initialize(data)
    @prev_pointer = nil
    @data = data
    @next_pointer = nil
  end
end

