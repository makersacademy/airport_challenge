require 'airports.rb'

class Planes
  attr_reader :status, :id
  @@plane_id = 1

  def initialize(airport, status = 'landed')
    @status = status
    @id = "Plane#{@@plane_id}"
    @@plane_id += 1
    @@airport_in_use = airport
    @@airport_in_use.add_plane(self)
  end

  def take_off
    if @status == 'in air'
      error_status('take off')
    else
      @status = 'in air'
      confirm_status('take off')
      @@airport_in_use.move_plane('air', self)
    end
  end

  def land
    if @status == 'landed'
      error_status('land')
    else
      @status = 'landed'
      confirm_status('land')
      @@airport_in_use.move_plane('land', self)
    end
  end

  def confirm_status(action = nil)
    if action == 'land'
      puts "#{self.id} has landed"
    elsif action == 'take off'
      puts "#{self.id} has taken off"
    end
  end

  def error_status(action)
    if action == 'land'
      puts "Error: #{self.id} has already landed..."
    elsif action == 'take off'
      puts "Error: #{self.id} is already in the air..."
    end
  end
end
