class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = false
  end

  # def land
  #   @landed = true
  # end

  # def take_off
  #   fail 'Plane is already in the air' unless @landed
  #   @landed = false
  # end

  def flying_status
    if @landed == false
      'Flying'
    else
      'Landed'
    end
  end
end
