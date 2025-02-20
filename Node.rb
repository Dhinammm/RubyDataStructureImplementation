class Node
  attr_accessor :data_part, :next_pointer ,:prev_pointer

  def initialize(data_part)
    @prev_pointer=nil
    @data_part=data_part
    @next_pointer=nil
  end
end

