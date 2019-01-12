require 'airport'
require 'rspec'
require 'plane'
# require 'weather'

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
      @airport.instance_variable_set(:@planes, [@plane])
      allow(@airport).to receive(:weather_safe?).and_return(true)
      expect(@airport.takeoff(@plane)).to eq(@plane)
    end

    it "should check that planes that have taken off are no longer in the airport" do
      @airport.instance_variable_set(:@planes, [@plane])
      allow(@airport).to receive(:weather_safe?).and_return(true)
      @airport.takeoff(@plane)
      expect(@airport.instance_variable_get(:@planes)).to eq([])
    end
  end

  describe 'prevent takeoff in stormy weather' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    
    it 'should stop aircraft from taking off in storms' do
      @airport.instance_variable_set(:@planes, [@plane])
      allow(@airport).to receive(:stormy?).and_return(true)
      expect { @airport.takeoff(@plane) }.to raise_error('Unable to takeoff: stormy weather')
    end
  end
  
  describe 'prevent landing in stormy weather' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy

    it 'should stop aircraft landing in storms' do
      allow(@airport).to receive(:stormy?).and_return(true)
      expect { @airport.land(@plane) }.to raise_error('Unable to land: stormy weather')
    end

  end

  describe 'planes should not be able to land when airport is full' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full

    it 'should not land planes when full' do
      allow(@airport).to receive(:weather_safe?).and_return(true)
      allow(@airport).to receive(:full?).and_return(true)
      expect { @airport.land(@plane) }.to raise_error('Unable to land: airport full')
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
