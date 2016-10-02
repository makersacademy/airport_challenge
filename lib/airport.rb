 require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
      @planes = []
  end

  def land(plane)
    confirm_landing
    @planes << plane
  end

  def take_off(plane)
    confirm_take_off
    @planes.pop
  end

private

  def confirm_landing
    puts "The plane has landed!"
  end

  def confirm_take_off
    puts "The plane has taken-off!"
  end
end
