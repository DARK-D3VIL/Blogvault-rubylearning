# main.rb

require_relative 'bst'
require_relative 'linked_list'

puts "Choose one:"
puts "1. Linked List"
puts "2. Binary Search Tree"

choose = gets.chomp.to_i

if choose == 2
  tree = BST.new
  loop do
    puts "\nChoose an option:"
    puts "1. Insert"
    puts "2. Search"
    puts "3. Find minimum"
    puts "4. Find maximum"
    puts "5. Inorder Traversal"
    puts "6. Preorder Traversal"
    puts "7. Postorder Traversal"
    puts "8. Level Order Traversal"
    puts "9. Delete"
    puts "10. Print Root to Leaf Path"
    puts "11. Exit"

    choice = gets.chomp.to_i
    case choice
    when 1
      puts "Enter comma-separated values:"
      values = gets.chomp
      tree.insert(values)
    when 2
      puts "Enter value to search:"
      val = gets.chomp.to_i
      puts tree.search(val) ? "Value found in tree" : "Value not found"
    when 3 then tree.find_min
    when 4 then tree.find_max
    when 5 then tree.inorder
    when 6 then tree.preorder
    when 7 then tree.postorder
    when 8 then tree.level_order_traversal
    when 9
      puts "Enter value to delete:"
      val = gets.chomp.to_i
      tree.delete(val)
    when 10 then tree.print_path
    when 11 then break
    else puts "Invalid choice, try again."
    end
  end

else
  ll = LinkedList.new
  loop do
    puts "\nChoose an option:"
    puts "1. Insert Head"
    puts "2. Insert Tail"
    puts "3. Insert at Position"
    puts "4. Delete Node"
    puts "5. Search"
    puts "6. Reverse List"
    puts "7. Print List"
    puts "8. Exit"

    choice = gets.chomp.to_i
    case choice
    when 1
      puts "Enter value for head:"
      val = gets.chomp.to_i
      ll.insert_head(val)
    when 2
      puts "Enter value for tail:"
      val = gets.chomp.to_i
      ll.insert_tail(val)
    when 3
      puts "Enter value:"
      val = gets.chomp.to_i
      puts "Enter position:"
      pos = gets.chomp.to_i
      ll.insert_pos(val, pos)
    when 4
      puts "Enter value to delete:"
      val = gets.chomp.to_i
      ll.delete_node(val)
    when 5
      puts "Enter value to search:"
      val = gets.chomp.to_i
      ll.search(val)
    when 6 then ll.reverse_list
    when 7 then ll.print_list
    when 8 then break
    else puts "Invalid choice, try again."
    end
  end
end
