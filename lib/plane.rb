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
      @location=airport
      @flying=false
      "The plane has landed at #{airport.name}"
    end
  end

  def take_off airport
    if airport.weather=='Stormy'
      'Cannot take off while weather is stormy.'
    else
      @location=nil
      @flying=true
      "The plane has taken off from #{airport}"
    end
  end

end