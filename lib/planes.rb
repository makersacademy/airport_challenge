class Planes
  attr_reader :landed

  def initialize
    @landed = true
  end

  def take_off
    fail 'The plane has already taken off' if @landed == false
    @landed = false
  end

  def land
    fail 'The plane has already landed' if @landed == true
    @landed = true
  end

end
