def feast(beast, dish)
  b = beast.chr.to_s
  d = dish.chr.to_s
  
  if b == d
    puts true
  else
    puts false
  end
end

feast("great blue heron", "garlic naan")