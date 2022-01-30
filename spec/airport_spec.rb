require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe 'Airport' do
  describe '#land_plane' do
    let(:weather) { double :weather }
    it 'accepts a plane to land into airport' do
      allow(weather).to receive(:flying_conditions).and_return(false)
      airport = Airport.new
      airport.land_plane(Plane.new)
      expect(airport.status).to eq("There are now 1 planes in the airport") 
    end

    let(:weather) { double :weather }
    it 'raises an error if airport is full' do
      allow(weather).to receive(:flying_conditions).and_return(false)
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times { airport.land_plane Plane.new }  
      expect { airport.land_plane(Plane.new) }.to raise_error("airport is full, no landing space available")
    end
  end

  describe '#takeoff_plane' do
    let(:weather) { double :weather }
    it 'releases a plane from airport' do
      allow(weather).to receive(:flying_conditions).and_return(false)
      expect(Airport.new).to respond_to(:takeoff_plane)
    end
  end

  describe 'weather check' do
    let(:weather) { double :weather }
    it 'should check the weather is not suitable for taking off' do
      airport = Airport.new
      allow(weather).to receive(:flying_conditions).and_return(true)
      expect { airport.takeoff_plane }.to raise_error("Stormy weather, no takeoff or landing possible")
    end

    let(:weather) { double :weather }
    it 'should check the weather is not suitable for landing' do
      airport = Airport.new
      allow(weather).to receive(:flying_conditions).and_return(true)
      expect { airport.land_plane(Plane.new) }.to raise_error("Stormy weather, no takeoff or landing possible")
    end
  end

  let(:weather) { double :weather }
  it 'should be able to override default capcaity of 5' do
    allow(weather).to receive(:flying_conditions).and_return(false)
    airport = Airport.new(10)
    10.times { airport.land_plane Plane.new }  
    expect { airport.land_plane(Plane.new) }.to raise_error("airport is full, no landing space available")
  end
end
