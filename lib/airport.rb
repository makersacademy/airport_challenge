class Airport
  def land(_plane)
    fail "Stormy cannot land" if stormy?
  end

  def take_off(_plane)
    true
  end

  def landed?(_plane)
    true
  end

  def departed?(_plane)
    true
  end

   def stormy?(_plane)
   end
end