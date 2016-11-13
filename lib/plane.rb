class Plane

  attr_reader :landed
  attr_writer :landed

  def initialize(landed = false)
    @landed = landed
  end

end
