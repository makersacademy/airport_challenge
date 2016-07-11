class Plane

  def lands
    @landed = true
  end

  def landed?
    @landed
  end

  def takesoff
    @departed = true
  end

  def departed?
    @departed
  end 
end
