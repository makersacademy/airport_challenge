require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    fail 'Not an integer' unless capacity.is_a?(Integer)
    fail 'Not positive' unless capacity > 0
    @planes = []
    @capacity = capacity
    @weather = :sunny
  end

  def take_off(number)
    change_weather
    fail 'Not safe to take off' if weather == :stormy
    number == 1 ? takes_off : take_offs(number)
  end

  def takes_off
    fail 'No planes' if empty?
    plane = planes.pop
    plane.tap(&:fly)
  end

  def take_offs(number)
    fail 'Not enough planes' if planes.length < number
    if number == 2 || number == 3
      plane = planes.pop(number)
      plane.each(&:fly)
    else
      fail 'Too many planes taking off'
    end
  end

  def land(plane, *args)
    change_weather
    fail 'Not safe to land' if weather == :stormy
    args.empty? ? landing(plane) : landings(plane, args)
  end

  def landing(plane)
    fail 'Airport full' if full?
    fail 'Not a plane' unless plane.respond_to?(:lands)
    plane.lands
    planes << plane
  end

  def landings(plane1, *args)
    collection = [plane1] + args
    collection.flatten!
    fail_checks(collection)
    collection.each(&:lands)
    @planes += collection
  end

  def fail_checks(collection)
    fail 'Airport full' if planes.length > capacity - collection.length
    fail 'Too many planes landing' if collection.length > 3
    fail 'Not planes' unless collection.all? { |p| p.respond_to?(:lands) }
  end

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

  private

  def change_weather
    n = rand(5)
    n == 4 ? @weather = :stormy : @weather = :sunny
  end
end
