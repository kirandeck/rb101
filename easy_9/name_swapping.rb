def swap_name(name)
  swap = name.split
  swap[0], swap[1] = swap[1], swap[0]
  swap.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
