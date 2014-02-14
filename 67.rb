# Find the maximum total from top to bottom in triangle.txt,
# a triangle with one-hundred rows.
#
# My Notes:
# - The algorithm is as follows (ack):
#   (1) Begin with the penultimate row. For each element of this row, change the value
#       to the sum of the element and its greatest child
#   (2) Remove the row and repeat the process until the root is reached

def change_row(arr, r_idx)
  row = arr[r_idx]
    
  row.each_with_index do |e, idx|
    left_child = arr[r_idx+1][idx].to_i
    right_child = arr[r_idx+1][idx+1].to_i
    row[idx] = (e.to_i + [left_child, right_child].max).to_s
  end
  arr
end

def sum_tree_path(tree)
  return tree if tree.size == 1
  change_row(tree, tree.size - 2)
  tree.pop
  sum_tree_path(tree)
end

tree = File.readlines('./files/triangle.txt').map(&:split)
p sum_tree_path(tree)
