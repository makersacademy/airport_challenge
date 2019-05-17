class Airport
  attr_reader :landed
  def land(flying_object)
    @landed = flying_object
    flying_object
  end
end
