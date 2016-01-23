class Plane
  attr_accessor :instruct_to_land
  attr_accessor :has_landed
  def initialize
    @instruct_to_land = false
    @has_landed = false
  end
end
