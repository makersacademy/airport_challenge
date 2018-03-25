require 'airport'

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

  describe '.allow_landing?' do 

    subject(:full_airport) { described_class.new(100) }
    it 'returns false when airport at max capicity' do
      100.times { full_airport.add_plane('plane') }
      expect(full_airport.allow_landing?).to eq(false)
    end 
    
    subject(:stormy_airport) { described_class.new(100) }
    it 'returns false when whether is stormy' do 
      stormy_airport.stub(:stormy?) { true }
      expect(stormy_airport.allow_landing?).to eq(false)
    end 
    
    it 'returns true when there is no reasons to deny landing' do
      subject.stub(:stormy?) { false }
      expect(subject.allow_landing?).to eq(true)
    end 
  end 
end 
