class Plane

  def initialize
    @location = :not_in_use
  end

  attr_reader :location
  attr_writer :location

end
