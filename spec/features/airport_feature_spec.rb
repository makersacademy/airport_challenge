require 'airport'
require 'rspec'
require 'plane'

describe Airport do

  before(:each) do
    @airport = Airport.new
  end

  describe "landing process" do

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport

    it "should be able to land planes" do
      plane = Plane.new
      expect(@airport.land(plane)).to eq([plane])
    end
  end

  describe "takeoff process" do

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it "should be able to instruct a plane to take off" do
      plane = Plane.new
      @airport.instance_variable_set(:@planes, [plane])
      expect(@airport.takeoff(plane)).to eq(plane)
    end

    it "should check that planes that have taken off are no longer in the airport" do
      plane = Plane.new
      @airport.instance_variable_set(:@planes, [plane])
      @airport.takeoff(plane)
      expect(@airport.instance_variable_get(:@planes)).to eq([])
    end
  end



  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy



  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full


  describe 'the ability to override default airport capacity' do

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it "can have its plane capacity overridden" do
      airport = Airport.new(15)
      expect(airport.instance_variable_get(:@capacity)).to eq(15)
    end
  end







end