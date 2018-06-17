class Plane

  def in_hangar?
    @in_hangar
  end

  def land
    @in_hangar = true
  end

  def take_off
    @in_hangar = false
  end

end
