require_relative "./linked_list_node"

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    new_node = LinkedListNode.new(value, @data)
    @data = new_node
  end

  def pop!
    return nil if @data.nil?
    top_node = @data
    @data = top_node.next_node
    top_node
  end

  def reverse
    reversed_stack = Stack.new
    node = @data
    until node.nil?
      reversed_stack.push(node.value)
      node = node.next_node
    end
    reversed_stack
  end
end
