# BST implementation in Ruby --------------------------------------------------------------------------------

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val, left=nil, right=nil)
        @val = val
        @left = left
        @right = right
    end
end

class BST
    attr_accessor :root
    def initialize(root=nil)
        @root = root
    end

    def insert(values)
        if values.is_a?(String)
            values = values.split(',').map(&:strip).map(&:to_i)
        end

        if !values.is_a?(Array)
            values = [values]
        end

        values.each do |val|
            @root = insert_node(@root, val)
        end
        puts "Data is inserted successfully"
    end

    def search(val)
        node = @root
        while node != nil
            if val == node.val
                return true
            elsif val < node.val
                node = node.left
            else
                node = node.right
            end
        end
        false
    end    

    def find_min()
        if @root == nil
            return nil
        end

        min_node = find_min_node(@root)
        puts "minimum value node is : #{min_node.val}"
    end

    def find_max()
        if @root == nil
            return nil
        end

        max_node = find_max_node(@root)
        puts "Maximum value node is : #{max_node.val}"
    end

    def inorder()
        if @root == nil
            puts "Tree is empty"
            return
        end
        puts "Inorder Traversal:"
        inorder_traversal()
        puts
    end

    def preorder()
        if @root == nil
            puts "Tree is empty"
            return
        end
        puts "Preorder Traversal:"
        preorder_traversal()
        puts
    end

    def postorder()
        if @root == nil
            puts "Tree is empty"
            return
        end
        puts "Postorder Traversal:"
        postorder_traversal()
        puts
    end

    def level_order_traversal(node=@root)
        if node==nil
            puts "Tree is empty"
            return
        end
        queue = []
        queue.push(node)
        while !queue.empty?
            curr = queue.shift
            print "#{curr.val} "
            if curr.left != nil
                queue.push(curr.left)
            end
            if curr.right != nil
                queue.push(curr.right)
            end
        end
        puts
    end

    def delete(val)
        if @root == nil
            puts "Tree is empty"
            return
        end
        if search(val) == false
            puts "Value not found in the tree"
            return
        end
        @root = delete_node(@root,val)
        puts "Value deleted successfully"
    end

    def print_path()
        if @root == nil
            puts "Tree is empty"
            return
        end
        puts "Root to leaf path:"
        root_to_leaf_path(@root)
        puts
    end

    private # private methos highlited -------------------------------------------------
    
    def insert_node(node,val)
        if node == nil
            return TreeNode.new(val)
        end

        if val < node.val
            node.left = insert_node(node.left,val)
        elsif val > node.val
            node.right = insert_node(node.right,val)
        end

        node
    end

    def delete_node(node,val)
        if node==nil
            return nil
        end

        if val < node.val
            node.left = delete_node(node.left,val)
        elsif val > node.val
            node.right = delete_node(node.right,val)
        else
            if(node.left == nil && node.right == nil)
                return nil
            end

            if(node.left == nil)
                return node.right
            end

            if(node.right == nil)
                return node.left
            end

            min_node = find_min_node(node.right)
            node.val = min_node.val
            node.right = delete_node(node.right,min_node.val)
        end

        node
    end

    def find_min_node(node)
        while node.left != nil
            node = node.left
        end
        node
    end

    def find_max_node(node)
        while node.right != nil
            node = node.right
        end
        node
    end

    def inorder_traversal(node=@root)
        if node==nil 
            return
        end
        inorder_traversal(node.left)
        print "#{node.val} "
        inorder_traversal(node.right)
    end

    def preorder_traversal(node=@root)
        if node==nil
            return
        end
        print "#{node.val} "
        preorder_traversal(node.left)
        preorder_traversal(node.right)
    end

    def postorder_traversal(node=@root)
        if node==nil
            return
        end
        postorder_traversal(node.left)
        postorder_traversal(node.right)
        print "#{node.val} "
    end

    def root_to_leaf_path(node=@root, path=[])
        if node == nil
            return
        end

        path << node.val

        if node.left == nil && node.right == nil
            puts path.join(' ')
            puts
        else
            root_to_leaf_path(node.left, path)
            root_to_leaf_path(node.right, path)
        end

        path.pop
    end
end


# linked list Implimentation-------------------------------------------------------------------------------

class ListNode
    attr_accessor :val, :next
    def initialize(val,nxt=nil)
        @val=val
        @next=nxt
    end
end

class LinkedList
    attr_accessor :head

    def initialize(head=nil)
        @head = head
    end

    def insert_head(val)
        node = ListNode.new(val,head)
        @head = node
    end

    def insert_tail(val)
        if(@head==nil)
            insert_head(val)
            return
        end
        node = @head;

        while node.next != nil
            node = node.next
        end

        newnode = ListNode.new(val)
        
        node.next = newnode
    end

    def insert_pos(val, pos)
        if pos == 0
            insert_head(val)
            return
        end
    
        node = @head
        idx = 0
    
        while idx < pos - 1 && node != nil
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
        if @head == nil
            puts "List is empty"
            return
        end

        if @head.val == val
            @head = @head.next
            return
        end
        
        node = @head.next
        prev = @head
    
        while node != nil
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
        if @head == nil
            puts "List is empty"
            return
        end

        node = @head
        idx = 0
        while node != nil
            if node.val == val
                puts "Value found at index #{idx}"
                return
            end
            idx = idx + 1
            node = node.next
        end
        puts "Value not found in the list"
    end

    def reverse_list
        return puts "List is empty" if @head.nil?

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
    
    def print_list()
        if @head == nil
            puts "List is empty"
            return
        end

        node = @head
        while node != nil
            print "#{node.val} "
            node=node.next
        end

        puts
    end
end

# main area -----------------------------------------------------------------------------------------------------


puts("Choose one")
puts("1. Linked List")
puts("2. Binary Search Tree")

choose = gets.chomp.to_i

if choose==2
    tree = BST.new
    while true
        puts "Choose an option from the menu:"
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
        if choice == 1
            puts "Enter comma seprated values to insert in a BST"
            values = gets.chomp
            tree.insert(values)

        elsif choice == 2

            puts "Enter value to search"
            val = gets.chomp.to_i
            if tree.search(val)
                puts "value found in tree"
            else
                puts "value not found in tree"
            end
        
        elsif choice == 3
            tree.find_min()

        elsif choice == 4
            tree.find_max()

        elsif choice == 5
            tree.inorder()

        elsif choice == 6
            tree.preorder()

        elsif choice == 7
            tree.postorder()

        elsif choice == 8
            tree.level_order_traversal()
        
        elsif choice == 9
            puts("Enter Value you want to Delete")
            value = gets.chomp.to_i
            tree.delete(value)
        
        elsif choice == 10
            tree.print_path()

        elsif choice == 11
            break

        else
            puts "Choose from the menu enter only number !!!!"
        end
    end

else
    ll = LinkedList.new
    while true
        puts "Choose an option from the menu:"
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
            puts "Enter value to insert at head"
            val = gets.chomp.to_i
            ll.insert_head(val)
        when 2
            puts "Enter value to insert at tail"
            val = gets.chomp.to_i
            ll.insert_tail(val)
        when 3
            puts "Enter value to insert at position"
            val = gets.chomp.to_i
            puts "Enter position"
            pos = gets.chomp.to_i
            ll.insert_pos(val,pos)
        when 4
            puts "Enter value to delete"
            val = gets.chomp.to_i
            ll.delete_node(val)
        when 5
            puts "Enter value to search"
            val = gets.chomp.to_i
            ll.search(val)
        when 6
            ll.reverse_list()
        when 7
            ll.print_list()
        when 8
            break
        else
            puts "Choose from the menu enter only number !!!!"
        end
    end
end




    
    