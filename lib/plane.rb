class Plane

  def initialize
    @flying = true
  end

  def to_land(airport=false)
    fail 'Cannot land without being instructed to' unless airport.is_a?(Airport)
    fail 'Plane already landed' unless in_air?
  end

  def confirm(status,airport)
    if status == :landed && airport.contains?(self)
      puts "Landing succesful"
      @flying = false
    elsif status == :took_off && (!airport.contains?(self))
      puts 'Take-off was succesful'
      @flying = true
    end
  end

  def take_off(airport=false)
    msg = 'Cannot take-off without being instructed to'
    fail msg unless airport.is_a?(Airport)
    fail 'Plane already in the air' if in_air?
  end

  def in_air?
   @flying
  end

end
