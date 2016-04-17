class Airport
  def land(_plane)
    raise "Stormy so cannot land plane" if stormy?
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
     true
   end
end