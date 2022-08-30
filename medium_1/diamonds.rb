def diamond(n)
  stars = 1
  spaces = n / 2
  while stars <= n
    puts ' ' * spaces + '*' * stars + ' ' * spaces
    stars += 2
    spaces -= 1
  end
  stars = n
  spaces = 0
  while stars > 1
    stars -= 2
    spaces += 1
    puts ' ' * spaces + '*' * stars + ' ' * spaces
  end
end

diamond(9)
