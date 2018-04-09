require_relative "../lib/stack"
require_relative "../lib/linked_list_node"

describe Stack do
  describe '#new' do
    it 'should return a stack object' do
      stack = Stack.new

      expect(stack).to be_a(Stack)
    end
  end

  describe '#data' do
    context 'without pushing anything on the stack' do
      it 'should return nil' do
        stack = Stack.new

        expect(stack.data).to be_nil
      end
    end

    context 'with a node on the stack' do
      it "should return the node's value" do
        stack = Stack.new
        stack.push(1)

        expect(stack.data.value).to eq(1)
      end
    end
  end

  describe '#push' do
    context 'without a value' do
      it 'should raise an error' do
        stack = Stack.new

        expect{stack.push}.to raise_error(ArgumentError)
      end
    end

    context 'with a value given' do
      it 'adds a node onto the stack with that value' do
        stack = Stack.new
        value = 10

        stack.push(value)

        expect(stack.data.value).to eq(value)
      end
    end
  end

  describe '#pop!' do
    it 'returns the nodes form the stack top -> down' do
      stack = Stack.new
      v1 = 10
      v2 = 20
      v3 = 30

      [v1, v2, v3].each { |v| stack.push(v) }

      return_v3 = stack.pop!.value
      return_v2 = stack.pop!.value
      return_v1 = stack.pop!.value
      return_nil = stack.pop!

      expect([return_v3, return_v1, return_nil]).to eq([v3, v1, nil])
    end
  end

  describe '#reverse' do
    it 'returns a new stack in reverse order' do
      # stack should return values in reverse
      values = [1, 2, 3, 4, 5]
      stack = Stack.new
      values.each { |v| stack.push(v) }

      reverse_stack = stack.reverse
      returned_reverse_vals = []
      values.size.times { returned_reverse_vals << reverse_stack.pop!.value }

      expect(returned_reverse_vals).to eq(values)
    end
  end
end
