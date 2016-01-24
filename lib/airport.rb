require_relative 'plane'

class Airport
  # Read permission for value types
  attr_reader :code, :capacity
  # Set default capacity
  DEFAULT_CAPACITY = 100

  # Airport must be initialized with a three-letter code string
  # or symbol, e.g. "LAX" or :LAX
  def initialize(code, capacity=DEFAULT_CAPACITY)
    fail "Please provide a three-letter code for this airport" unless code.length >= 3
    @code = code[0..2].upcase.to_sym
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def stormy?
    generate_weather
    stormy
  end

  def inbound(plane)
    fail "Permission to land denied, #{self} is full" if full?
    dock plane
  end

  def outbound(plane)
    fail "There are no planes at #{self}" if empty?
    fail "Plane is not currently at #{self}" unless include? plane
    remove plane
  end

  # Ensures encapsulation by not exposing @planes#include?
  def include?(plane)
    planes.include? plane
  end

  # Improves readability for Plane#location and error messages
  def to_s
    code.to_s
  end

  # NOTE: consider overwriting #inspect

  private
  attr_reader :stormy, :planes

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.size <= 0
  end

  def dock(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete plane
  end

  # FIXME: extract as module or class
  def generate_weather
    # 1 in 20 chance of weather being stormy
    @stormy = (rand(20) == 0)
  end
end
