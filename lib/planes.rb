require 'airports.rb'

class Planes
  attr_reader :status, :id
  @@plane_id = 1

  def initialize(airport, status = 'landed')
    set_status(status, true)
    @id = "Plane#{@@plane_id}"
    @@plane_id += 1
    @@airport_in_use = airport
    @@airport_in_use.add_plane(self)
  end



def take_off
  fail "Warning: Cannot take-off in stormy weather!" if @@airport_in_use.weather == 'stormy'
  fail "Error: #{id} is already in the air..." if status == 'in air'
  set_status('in air')
  @@airport_in_use.move_plane('air', self)
end

  def land
    fail "Warning: Cannot land in stormy weather!" if @@airport_in_use.weather == 'stormy'
    fail "Warning: Airport is full!" if @@airport_in_use.full?
    fail "Error: #{id} has already landed..." if status == 'landed'
    set_status('landed')
    @@airport_in_use.move_plane('land', self)
  end

  def set_status(status, init = false)
    @status = status
    confirm_status(status) unless init
  end

  def confirm_status(action = nil)
    if action == 'landed'
      puts "#{id} has landed"
    elsif action == 'in air'
      puts "#{id} has taken off"
    end
  end

end
