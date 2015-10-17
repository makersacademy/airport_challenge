class Plane
  attr_reader :id
  attr_accessor :flying, :location
  def initialize(id)
    @id = id
    @flying = false
    @location = nil
  end
end
