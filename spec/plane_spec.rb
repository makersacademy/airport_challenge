require 'plane.rb'

class FakeAirport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full!' if full?
    fail 'That plane is already landed here!' if @planes.include? plane
    plane.status = "Landed"
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if empty?
    @planes.pop.status = "Taken off"
  end

  private
  attr_reader :plane

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end

describe Plane do

  airport = FakeAirport.new
  plane = Plane.new
  airport.land(plane)

  it 'reports when it has taken off' do
    airport.take_off
    expect(plane.status).to eq "Taken off"
  end

  it 'reports when it has landed' do
    airport.land(plane)
    expect(plane.status).to eq "Landed"
  end

end
