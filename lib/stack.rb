require_relative "./linked_list_node"
require "pry"

class Stack
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(value)
    @head = LinkedListNode.new(value, head)
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
    tail = head.next_node
    @head.next_node = nil
    @head = _reverse!(head, tail)
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

  def _reverse!(new_head, tail)
    return new_head if tail.nil?

    previous_node = tail.next_node
    tail.next_node = new_head
    _reverse!(tail, previous_node)
  end
end
