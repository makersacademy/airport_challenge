class Plane
  def initialize
    @flying = true
  end

  def instruct_take_off
    raise 'Plane cannot take off. Plane is already flying' if @flying
  end

  def instruct_landing(airport)
    raise 'Plane cannot land. Plane has already landed' unless @flying
    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane cannot be at airport. Plane is already flying' if @flying
    @airport
  end
end
