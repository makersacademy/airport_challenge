require 'airport'
require 'byebug'

describe Airport do 
  describe '.new' do 
    subject(:default) { described_class.new }
    it 'initializes with a default value for @max_capacity' do
      expect(default.max_capacity).to eq(100)
    end 
    
    subject(:custom) { described_class.new(2000) }
    it 'allows @max_capacity to be set via an argument' do 
      expect(custom.max_capacity).to eq(2000)
    end 
  end 

  describe '.add_plane' do 
    subject(:airport) { described_class.new }
    it 'accepts new airplanes' do 
      airport.add_plane('plane')
      expect(airport.hangar.size).to be(1)
    end 
  end

  describe '.full?' do 
    subject(:default_airport) { described_class.new }
    subject(:custom_airport) { described_class.new(2000) }

    it 'returns true when full (default capacity airport)' do 
      100.times { default_airport.add_plane('airplane') }
      expect(default_airport.full?).to eq(true)
    end 

    it 'returns false when not full (default capacity airport)' do 
      37.times { default_airport.add_plane('airplane') }
      expect(default_airport.full?).to eq(false)
    end 

    it 'returns false when airport contains no airplanes' do 
      expect(default_airport.full?).to eq(false)
    end 

    it 'returns true when full (custom capacity airport)' do 
      2000.times { custom_airport.add_plane('airplane') }
      expect(custom_airport.full?).to eq(true)
    end 

    it 'returns false when not full (custom capacity airport)' do 
      1486.times { custom_airport.add_plane('airplane') }
      expect(custom_airport.full?).to eq(false)
    end 
  end
end 
