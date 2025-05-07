class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      @tail.next_node = entry
      @tail = entry
    end
  end

  def prepend(value)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      entry.next_node = @head
      @head = entry
    end
  end

  def size
    size = 0
    cur = @head
    while cur
      size += 1
      cur = cur.next_node
    end
    size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index) 
    return nil if index > (self.size - 1) || index < 0
    return nil if @head.nil?
    count = 0
    cur = @head
    while cur
      if count == index
        return cur
      end
      cur = cur.next_node
      count += 1
    end
  end

  def pop
    return nil if @head.nil?

    if @head == @tail
      popped = @head
      @head = nil
      @tail = nil
      return popped
    end

    cur = @head
    until cur.next_node == @tail
      cur = cur.next_node
    end
    popped = @tail
    cur.next_node = nil
    @tail = cur
    popped
  end

  def contains?(value)
    cur = @head
    while cur
      if cur.value == value
        return true
      end
      cur = cur.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?
    index = 0
    cur = @head
    while cur
      return index if cur.value == value
      cur = cur.next_node
      index += 1
    end
    nil
  end

  def to_s
    output = ""
    cur = @head
    while cur
      output << "(#{cur.value}) -> "
      cur = cur.next_node
    end
    output << "nil"
  end

  # Extra credit
  def insert_at(value, index)
    return self.prepend(value) if index == 0
    return self.append(value) if index == (self.size - 1)
    return nil if index > (self.size - 1) || index < 0
    return nil if @head.nil? && index > 0

    insert = Node.new(value)
    count = 0
    cur = @head
    while count < (index - 1)
      cur = cur.next_node
      count += 1
    end
    insert.next_node = cur.next_node
    cur.next_node = insert
  end

  def remove_at(index)
    return nil if index > (self.size - 1) || index < 0
    return nil if @head.nil? && index > 0

    if index == 0
      removed = @head
      @head = @head.next_node
      return removed
    elsif index == (self.size - 1)
      removed = @tail
      self.pop
      return removed
    end

    count = 0
    cur = @head
    while count < (index - 1)
      cur = cur.next_node
      count += 1
    end
    removed = cur.next_node
    cur.next_node = cur.next_node.next_node
    removed
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end