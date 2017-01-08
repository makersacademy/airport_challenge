class Plane

  def initialize
    @landed = false
  end

  def in_flight?
    if @landed == false
      return 'In Flight.'
    elsif @landed == true
      return 'Landed.'
    end
  end
end
