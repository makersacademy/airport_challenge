class Plane
  attr_accessor :status

  def land(airport)
    @status = 'landed'
    @airport = airport
  end

end
