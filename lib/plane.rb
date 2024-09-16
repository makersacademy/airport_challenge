class Plane
  attr_reader :position
  def initialize(position = "air")
    @position = position
  end

  def change_position
    @position == "air" ? @position = "ground" : @position = "air"
  end
end
