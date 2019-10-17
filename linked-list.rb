class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(value)
  end

  def add(value)
    current = @head
    while !current.next_node.nil?
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  def print(node=@head)
    puts node.value
    if node.next_node
      print(node.next_node)
    end
  end

  def reverse_list
    prev = nil
    current = @head
    
    while current != nil
      nxt = current.next_node
      current.next_node = prev
      prev = current
      current = nxt
    end
    
    @head = prev
    self.print
  end
end

node = LinkedList.new(12)
node.add(99)
node.add(37)

puts node.print
puts "-------"
rev = node.reverse_list


