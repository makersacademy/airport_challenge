class Airport


  def land(plane)
    fail 'Airtport full' unless @plane == nil
    @plane = plane
  end

  def take_off(plane)
    "#{plane} no longer in #{self} airport"
  end

end
