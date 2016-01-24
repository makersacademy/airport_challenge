class Plane
  attr_reader :landed, :in_airport

  def initialize
    @landed = true
    @in_airport = false
  end

  def has_landed?
    landed
  end

  def in_airport?
    in_airport
  end
end
