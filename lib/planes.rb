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
    if @@airport_in_use.weather == 'stormy'
      error_status('weather-take_off')
    else
      if @status == 'in air'
        error_status('take off')
      else
        set_status('in air')
        @@airport_in_use.move_plane('air', self)
      end
    end
  end

  def land
    if @@airport_in_use.weather == 'stormy'
      error_status('weather-land')
    else
      if @status == 'landed'
        error_status('land')
      else
        set_status('landed')
        @@airport_in_use.move_plane('land', self)
      end
    end
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

  def error_status(action)
    if action == 'land'
      puts "Error: #{id} has already landed..."
    elsif action == 'take off'
      puts "Error: #{id} is already in the air..."
    elsif action == 'weather-take_off'
      puts "Warning: Cannot take-off in stormy weather!"
    elsif action == 'weather-land'
      puts "Warning: Cannot land in stormy weather!"
    end
  end
  
end
