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

  def reverse
    _reverse(head)
  end

  def reverse!
    node = head
    @head = nil
    _reverse!(node)
  end

  def print_stack
    puts _create_output_string(head, '')
  end

  private


  def _create_output_string(node, output)
    return output << 'nil' if node.nil?

    output << "#{node.value} --> "
    _create_output_string(node.next_node, output)
  end

  def _reverse(node, stack = Stack.new)
    return stack if node.nil?

    stack.push(node.value)
    _reverse(node.next_node, stack)
  end

  def _reverse!(node)
    return if node.nil?

    push(node.value)
    _reverse!(node.next_node)
  end
end
