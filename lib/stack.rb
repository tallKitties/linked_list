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

  def reverse!
    node = @data
    @data = nil
    reverse_data(node)
  end

  def print_stack
    node = @data
    output = ''

    while node
      output << "#{node.value} --> "
      node = node.next_node
    end

    puts output + 'nil'
  end

  private

  def reverse_data(node)
    node.nil? ? return : push(node.value)
    reverse_data(node.next_node)
  end
end
