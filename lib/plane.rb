class Plane
  def initialize
    @landed = false
    @stormy = false
  end
  def land(airport)
    if @landed
      raise "The plane has already landed"
    elsif @stormy
      raise "The plane can't land in this weather"
    elsif airport.full
      raise "The plane can't land at a full airport"
    else
      @landed = true
      "The plane has successfully landed"
    end
  end
  def take_off
    if @landed == false
      raise "The plane is already in the air"
    elsif @stormy
      raise "The plane cannot take off in this weather"
    else
      @landed = false
      "The plane has successfully taken off"
    end
  end
  attr_reader :landed
  attr_reader :stormy
end
