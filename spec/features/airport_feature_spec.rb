require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  describe "landing process" do

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport

    it "should be able to land planes" do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      expect(@airport.land(@plane)).to eq([@plane])
    end
  end

  describe "takeoff process" do

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it "should be able to instruct a plane to take off" do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      @airport.land(@plane)
      expect(@airport.takeoff(@plane)).to eq(@plane)
    end

    it "should check that planes that have taken off are no longer in the airport" do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      @airport.land(@plane)
      @airport.takeoff(@plane)
      expect(@airport.instance_variable_get(:@planes)).to eq([])
    end
  end

  describe 'prevent takeoff in stormy weather' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    
    it 'should stop aircraft from taking off in storms' do
      allow(@airport).to receive(:stormy?).and_return(false)
      @airport.land(@plane)
      allow(@airport).to receive(:stormy?).and_return(true)
      expect { @airport.takeoff(@plane) }.to raise_error(Airport::STORMY_WEATHER_ERROR)
    end
  end
  
  describe 'prevent landing in stormy weather' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy

    it 'should stop aircraft landing in storms' do
      allow(@airport).to receive(:stormy?).and_return(true)
      expect { @airport.land(@plane) }.to raise_error(Airport::STORMY_WEATHER_ERROR)
    end

  end

  describe 'planes should not be able to land when airport is full' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full

    it 'should not land planes when full' do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      airport = Airport.new(1)
      plane1 = @plane
      plane2 = Plane.new

      airport.land(plane1)
      expect { airport.land(plane2) }.to raise_error(Airport::AIRPORT_FULL_ERROR)
    end

  end

  describe 'the ability to override default airport capacity' do

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it "can have its plane capacity overridden" do
      airport = Airport.new(15)
      expect(airport.instance_variable_get(:@capacity)).to eq(15)
    end
  end

  describe 'multiple planes can takeoff and land' do
    it "can takeoff and land a number of planes" do
      plane1 = Plane.new
      plane2 = Plane.new
      allow(@airport).to receive(:weather_safe?).and_return(true)

      expect(@airport.land(plane1)).to eq([plane1])
      expect(@airport.land(plane2)).to eq([plane1, plane2])

      expect(@airport.takeoff(plane1)).to eq(plane1)
      expect(@airport.takeoff(plane2)).to eq(plane2)

      expect(@airport.land(@plane)).to eq([@plane])
    end
  end

end
