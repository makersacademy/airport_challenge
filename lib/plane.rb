class Plane

  attr_reader :location, :flying

  def initialize
    @location=nil
    @flying=false
  end

  def land airport
    if airport.full
      'Cannot land while airport is full'
    elsif airport.weather=='Stormy'
      'Cannot land while weather is stormy.'
    else
      @location=airport.name
      @flying=false
      airport.planes << self
      "The plane has landed at #{airport.name}"
    end
  end

  def take_off airport
    if airport.planes.include? self
      if airport.weather=='Stormy'
        'Cannot take off while weather is stormy.'
      else
        @location=nil
        @flying=true
        "The plane has taken off from #{airport.name}"
      end
    else
      'The plane is not at this airport.'
    end
  end

end