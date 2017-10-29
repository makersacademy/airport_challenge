class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def change_status
    @landed == false ? @landed = true :  @landed = false
  end

end
