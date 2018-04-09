require_relative "../lib/linked_list_node"

describe LinkedListNode do
  describe '#new' do
    context 'with no value given' do
      it 'raises an error' do
        expect{LinkedListNode.new}.to raise_error(ArgumentError)
      end
    end
    context 'with a value' do
      it 'returns a node' do
        expect(LinkedListNode.new(1)).to be_a(LinkedListNode)
      end
    end
  end

  describe '#value' do
    it 'should return the value given' do
      value = 11

      node = LinkedListNode.new(value)

      expect(node.value).to eq(value)
    end
  end

  describe '#next_node' do
    context 'with no next node given' do
      it 'should return nil' do
        node = LinkedListNode.new(1)

        expect(node.next_node).to be_nil
      end
    end

    context 'given a next node object' do
      it 'should return that node' do
        first_node = LinkedListNode.new(10)
        second_node = LinkedListNode.new(20, first_node)

        node_returned = second_node.next_node

        expect(node_returned).to eq(first_node)
      end
    end
  end
end
