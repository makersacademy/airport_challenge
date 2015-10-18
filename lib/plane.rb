class Plane

  attr_reader :location
  attr_accessor :flying

  def initialize
    @location=nil
    @flying=true
  end

  def land airport
    if @flying==true
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
    else 
      'This plane is already on the ground.'
    end 
  end

  def take_off airport
    if @flying==false
      if airport.planes.include?(self)
        if airport.weather=='Stormy'
          'Cannot take off while weather is stormy.'
        else
          @location=nil
          @flying=true
          airport.planes.delete(self)
          "The plane has taken off from #{airport.name}"
        end
      else
        'The plane is not at this airport.'
      end
    else  
    'The plane is already flying'
    end  
  end

end