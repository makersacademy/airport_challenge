require 'airports.rb'

class Planes
  attr_reader :status

  def initialize(airport = $airport)
    airport.add_plane(self)
  end

  def take_off(airport = $airport)
    if @status == 'in air'
      error_status('take off')
    else
      @status = 'in air'
      confirm_status('take off')
      airport.move_plane('air', self)
    end
  end

  def land(airport)
    if @status == 'landed'
      error_status('land')
    else
      @status = 'landed'
      confirm_status('land')
    end
  end

  def confirm_status(action = nil)
    if action == 'land'
      puts "#{self} has landed"
    elsif action == 'take off'
      puts "#{self} has taken off"
    end
  end

  def error_status(action)
    if action == 'land'
      puts "Error: #{self} has already landed..."
    elsif action == 'take off'
      puts "Error: #{self} is already in the air..."
    end
  end
end
