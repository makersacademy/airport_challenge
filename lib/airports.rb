require 'weather'

class Airports
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :in_air, :on_ground, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @on_ground = []
    @in_air = []
    @weather = (Weather.new).weather
  end

  def full?
    @on_ground.length >= @capacity
  end

  def move_plane(move, plane)
    if move == 'air'
      @on_ground.delete(plane)
      @in_air.push(plane)
    elsif move == 'land'
      @in_air.delete(plane)
      @on_ground.push(plane)
    end
  end

  def add_plane(plane)
    if plane.status == 'in air'
      @in_air.push(plane)
    else
      @on_ground.push(plane)
    end
  end

  def status
    puts "On Ground:"
    print "#{@on_ground.map { |each| each.id }}\n"
    puts "----------"
    puts "In Air"
    print "#{@in_air.map { |each| each.id }}"
  end

end
