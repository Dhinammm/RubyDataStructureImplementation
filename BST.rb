require_relative 'TreeNode'

class BST
  attr_accessor :root_node
  def initialize
    @root_node=nil
  end

  def insert_node(data_part)
    if @root_node.nil?
      @root_node=TreeNode.new(data_part)
    else
      current_node=@root_node
      while true
        if current_node.nil?
          current_node=TreeNode.new(data_part)
          break
        end
        if current_node.data_part<data_part
          if current_node.right_child.nil?
           current_node.right_child=TreeNode.new(data_part)
            break
          else
          current_node=current_node.right_child
          next
          end
        end
        if current_node.data_part>data_part
          if current_node.left_child.nil?
            current_node.left_child=TreeNode.new(data_part)
            break
          else
          current_node=current_node.left_child
          next
          end
        end
      end
    end
  end

  def inorder_traversal(temp_root)
    if temp_root.nil?
      return
    end
    inorder_traversal(temp_root.left_child)
    puts(temp_root.data_part)
    inorder_traversal(temp_root.right_child)
  end
end

r1=BST.new()
r1.insert_node(90)
r1.insert_node(89)
r1.insert_node(11)
r1.insert_node(2)
r1.insert_node(6)
r1.insert_node(9)
r1.inorder_traversal(r1.root_node)

