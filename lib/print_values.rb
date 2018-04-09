require_relative "./stack"

def print_values(node)
  if node
    print "#{node.value} --> "
    print_values(node.next_node)
  else
    print "nil\n"
  end
end
