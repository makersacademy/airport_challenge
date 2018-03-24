require 'airport'
require 'byebug'

describe Airport do 
  describe '.new' do 
    it 'initializes with a default value for @max_capacity' do
      expect(subject.max_capacity).to be(100)
    end 

    it 'allows @max_capacity to be set via an argument' do 
      airport = Airport.new(2000)
      expect(airport.max_capacity).to eq(2000)
    end 
  end 
  
  describe '.weather' do 
    it 'returns a weather string' do 
      weather = subject.weather
      expect(weather).to be_a(String)
    end
  end

  describe '.add_plane' do 
    it 'accepts new airplanes' do 
      airport = Airport.new
      airport.add_plane('plane')
      expect(airport.hangar.size).to be(1)
    end 
  end

  describe '.full?' do 
    it 'returns true when full (default capacity airport)' do 
      airport = Airport.new
      100.times { airport.add_plane('airplane') }
      expect(airport.full?).to eq(true)
    end 

    it 'returns false when not full (default capacity airport)' do 
      airport = Airport.new
      37.times { airport.add_plane('airplane') }
      expect(airport.full?).to eq(false)
    end 

    it 'returns false when airport contains no airplanes' do 
      expect(subject.full?).to eq(false)
    end 

    it 'returns true when full (custom capacity airport)' do 
      airport = Airport.new(2000)
      2000.times { airport.add_plane('airplane') }
      expect(airport.full?).to eq(true)
    end 

    it 'returns false when not full (custom capacity airport)' do 
      airport = Airport.new(2000)
      1486.times { airport.add_plane('airplane') }
      expect(airport.full?).to eq(true)
    end 
  end
end 
