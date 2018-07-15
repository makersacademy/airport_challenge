class Airport

  DEFAULT_CAPACITY = 20

  def initialize(name = 'airport', capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = Array.new
  end

  attr_reader :name

  attr_reader :capacity

  attr_reader :planes

  def planes_by_name
    string = ''
    @planes[0..@planes.length - 2].each do |planeobject|
      string += "#{planeobject.name}, "
    end
    string += @planes[planes.length - 1].name
    puts string
  end

  def land(plane)
    fail "The weather is too stormy to land" if stormy?
    fail "#{name} is too full to land" if full?
    @planes.push(plane)
    plane.make_airport(self)
    puts "#{plane.name} landed at #{name}"
  end

  def take_off(plane)
    fail "Try using take_off_by_name instead" unless plane.is_a? Plane
    fail "The weather is too stormy to take off" if stormy?
    puts "#{plane.name} took off from #{name}"
    @planes.delete(plane)
    plane.make_airport(nil)

  end

  def take_off_by_name(planename)
    fail "Try using take_off instead" unless planename.is_a? String
    fail "The weather is too stormy to take off" if stormy?
    @planes.each do |planeobject|
      if planeobject.name == planename
        puts "#{planeobject.name} took off from #{name}"
        @planes.delete(planeobject)
        planeobject.make_airport(nil)
        break
      end
    end
  end

  def stormy?
    roll = rand(1..10)
    return true if roll == 10
  end

  def full?
    return true if @planes.size >= @capacity
  end
end
