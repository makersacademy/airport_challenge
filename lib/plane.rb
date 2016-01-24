class Plane

  def initialize
    @on_ground = false
  end

  def to_land(airport=false)
    fail 'cannot land without aiport' unless airport.kind_of?(Airport)
    fail 'Plane already landed' unless in_air?
  end

  def confirm(status,airport)
    if status == 'landed' && airport.contains?(self)
      puts 'Landing was succesful'
      @on_ground = true
    elsif status == 'took-off' && (airport.contains?(self) == false)
      puts 'Take-off was succesful'
      @on_ground = false
    end
  end

  def take_off(airport=false)
    fail 'cannot take-off without aiport' unless airport.kind_of?(Airport)
    fail 'Plane already in the air' if in_air?
  end

  def in_air?
    true unless @on_ground
  end

end
