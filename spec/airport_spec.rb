require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) { double(:plane) } # same as plane = double("plane")

  describe 'allows plane to land' do
    it 'lands plane' do
      weather = double(:weather, :weather_ok? => true)
      airport.landing(plane, weather)
      expect(airport.planes_now.length).to be 1
    end
  end

  describe 'allows plane to take off' do
    it 'takes off plane' do
      weather = double(:weather, :weather_ok? => true)
      airport.landing(plane, weather)
      airport.allow_takeoff(plane, weather)
      expect(airport.planes_now.length).to be 0
    end
  end

  describe 'denies landing if weather stormy' do
    it "plane can't land" do
      weather = double(:weather, :weather_ok? => false)
      expect { airport.landing(plane, weather) }.to raise_error 'Bad weather, landing denied'
    end
  end

  describe 'denies take off if weather stormy' do
    it "plane can't take off" do
      weather = double(:weather, :weather_ok? => false)
      expect { airport.allow_takeoff(plane, weather) }.to raise_error 'Bad weather, takeoff denied'
    end
  end

  describe 'denies landing when airport full' do
    it "no space for plane to land" do
      weather = double(:weather, :weather_ok? => true)
      20.times { airport.landing(plane, weather) }
      expect { airport.landing(plane, weather) }. to raise_error 'Airport full, landing denied'
    end
  end
end
