class Airport
  attr_reader :landed

  def initialize
    @landed = []
  end

  def land(flying_object)
    landed.push(flying_object)
    flying_object
  end
end
