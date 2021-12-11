class Airport
  def confirm_takeoff
  end

  def full?
    true
  end

  def land(plane)
    raise 'No clearance to land: Airport is full' if full?
  end
end