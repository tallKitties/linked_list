require_relative "./linked_list_node"
require "pry"

class Stack
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(value)
    new_node = LinkedListNode.new(value, head)
    @head = new_node
  end

  def pop!
    return nil if head.nil?
    top_node = head
    @head = top_node.next_node
    top_node
  end

  def reverse(node = head, stack = Stack.new)
    return stack if node.nil?

    stack.push(node.value)
    reverse(node.next_node, stack)
  end

  def reverse!
    @head = reverse_stack(head, nil)
  end

  def print_stack
    puts create_output_string(head, '')
  end

  private

  def create_output_string(node, output)
    return output << 'nil' if node.nil?

    output << "#{node.value} --> "
    create_output_string(node.next_node, output)
  end

  def reverse_stack(node, stack)
    return stack if node.nil?

    next_node = node.next_node
    node.next_node = stack
    reverse_stack(next_node, node)
  end
end
