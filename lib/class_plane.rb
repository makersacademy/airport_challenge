class Plane
  @@planes = []
  attr_accessor :status

  def initialize
    @status = "on_ground"
    @@planes << self
  end

  def land
    @status = "on_ground"
  end

  def self.list_planes
    @@planes
  end
end
