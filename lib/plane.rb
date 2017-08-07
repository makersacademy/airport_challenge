class Plane
  # Naming convention of instances: STNUM e.g. CX255
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def status(air_control)
    me = air_control.planes.find { |x| x[:plane] == self }
    if me[:airport] == "nil"
      "Plane #{@name} is currently in #{me[:airspace].capitalize}'s airspace."
    elsif me[:airspace] == "nil"
      "Plane #{@name} is currently at the #{me[:airport].capitalize} Airport."
    else
    end
  end

end
