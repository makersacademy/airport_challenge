class Plane

# attr_accessor :landing
attr_accessor :airport
attr_accessor :flying
  # def request_landing(landing=false)
  #   @landing = landing
  # end

  def airport_location(airport)
    @airport = airport
  end

  def flying?(flying)
    @flying = flying
  end

end
