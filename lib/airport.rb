class Airport
  def land(_plane)
    fail "Stormy cannot land" if stormy?
    true
  end

  def take_off(_plane)
    fail "Cannot take off" if stormy?
    true
  end

  def landed?(_plane)
    true
  end

  def departed?(_plane)
    true
  end

   def stormy?(_plane)
    rand(1..2) == 1
   end
end