class Airport

  attr_reader :aircraft

  def land(obj)
    @aircraft = obj
  end

  def take_off
    @aircraft = nil
  end

end
