class Airports
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @on_ground = []
    @in_air = []
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
    @on_ground.push(plane)
  end

  def status
    puts "On Ground:"
    print "#{@on_ground.map { |each| each.id }}\n"
    puts "----------"
    puts "In Air"
    print "#{@in_air.map { |each| each.id }}"
  end

end
