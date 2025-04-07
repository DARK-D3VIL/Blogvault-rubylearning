# linked_list.rb

class ListNode
  attr_accessor :val, :next
  def initialize(val, nxt = nil)
    @val = val
    @next = nxt
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def insert_head(val)
    node = ListNode.new(val, head)
    @head = node
  end

  def insert_tail(val)
    return insert_head(val) unless @head

    node = @head
    node = node.next while node.next
    node.next = ListNode.new(val)
  end

  def insert_pos(val, pos)
    return insert_head(val) if pos == 0

    node = @head
    idx = 0
    while idx < pos - 1 && node
      node = node.next
      idx += 1
    end

    if node.nil?
      puts "Out of Bound position given"
      return
    end

    newnode = ListNode.new(val)
    newnode.next = node.next
    node.next = newnode
  end

  def delete_node(val)
    return puts "List is empty" unless @head

    if @head.val == val
      @head = @head.next
      return
    end

    prev, node = @head, @head.next

    while node
      if node.val == val
        prev.next = node.next
        return
      end
      prev = node
      node = node.next
    end

    puts "Value not found in the list"
  end

  def search(val)
    return puts "List is empty" unless @head

    node = @head
    idx = 0
    while node
      return puts "Value found at index #{idx}" if node.val == val

      idx += 1
      node = node.next
    end
    puts "Value not found in the list"
  end

  def reverse_list
    return puts "List is empty" unless @head

    prev = nil
    node = @head
    while node
      temp = node.next
      node.next = prev
      prev = node
      node = temp
    end
    @head = prev
  end

  def print_list
    return puts "List is empty" unless @head

    node = @head
    print "#{node.val} " while node && (node = node.next)
    puts
  end
end
