# in 'airport.rb'
class Airport
  # initialize is called automatically everytime you use .new
  def initialize
    @airport_bay_capacity = 5
    # this variable is accessible anywhere inside this class
    # how can you make it accessible from outside? by adding attr_reader below
    @bays_occupied = 0
  end
  attr_reader :bays_occupied
  attr_reader :airport_bay_capacity

  def takeoff(plane)
    # show that the plane is able to take off and its gone
    if stormy? == false # it is sunny and plane is allowed to takeoff
      @bays_occupied -= 1
    end
  end

  def landing(plane)
    # show that the plane is able to land and is present in the landing area
    if stormy? == false # it is sunny and plane is allowed to land
      @bays_occupied += 1
    end
  end

  def bay_available?
    # show whether there are available bays for plane to land
    if bays_occupied = airport_bay_capacity
      fail 'No bays available to land'
      false
    elsif bays_occupied > airport_bay_capacity
      puts 'umm, there are more planes than we have parking spots? REDO'
    else
      true
    end
  end

  def stormy?
    # randomize weather from sunny to stormy
    rand(1..17) > 16
  end

end

# in 'airport_spec.rb'
require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :bay_available? }
  # describe '#stormy?' do
  #   it 'warns us of the weather' do
  #     expect(weather).to be_stormy
  it { is_expected.to respond_to :stormy? }

  # airport records a new plane when it lands in sunny weather.
  describe "#landing" do
    it '.landing' do
      plane = Plane.new
      expect(subject.landing(plane)).to eq plane
    end
  end

  # airport loses a plane when it takes off in sunny weather.
  describe '#takeoff' do
    it 'lose a plane from the landing bay' do
      # we expect that when a plane takes off, @bays_available is increased by 1
      # how to read an instance variable from outside?
      expect(subject.take_off(plane)).to eq 'successful takeoff'
    end
  end

  # If there are no landing bays available, it raises an error
  describe '#bay_available?' do
    it 'raises an error when there are no landing bays available' do
      expect(subject.bay_available?).to raise_error 'No bays available to land'
    end
  end

end

# in 'plane.rb'
class Plane

end
