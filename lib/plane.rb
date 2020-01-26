class Plane
  attr_reader :airport
  def initialize(airport = true)
    @airport = airport
  end

  def landed?
    @airport
  end

  def planestatus
    if @airport
      @airport = false
    else
      @airport = true
    end
  end
end
