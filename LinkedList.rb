class Node
  @head=nil
  attr_accessor:data,:next
  def initialize(data)
    @data=data
    @next=nil
  end
end

First=Node.new(1000);

