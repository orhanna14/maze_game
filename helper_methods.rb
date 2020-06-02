def get_user_input
  stdin.gets.chomp
end

def add_to_items(items, item)
  items.push(item)
end