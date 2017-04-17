class Airport

  attr_reader :terminal

  def land(plane)
    raise RuntimeError, 'cannot land'
  end

end
