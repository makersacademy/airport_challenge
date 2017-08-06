class Plane
  # Naming convention of instances: STNUM e.g. CX255
  attr_accessor :name

  def initialize(name)
    @name=name
  end

  def status(air_control)
    me=air_control.planes.find{|x| x[:plane]==self}
    if me[:airport]=="nil"
     puts "Plane #{@name} is currently in #{me[:airspace].capitalize}'s airspace."
    else me[:airspace]=="nil"
     puts "Plane #{@name} is currently at the #{me[:airport].capitalize} Airport."
    end
  end

end
