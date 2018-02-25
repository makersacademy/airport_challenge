require 'airport.rb'

describe Airport do
  subject(:Airport) { Airport.new }  

  describe ':capacity' do

    it 'default capacity should be replaced if airport is initialized with an argument' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq(50)
    end
  
  end

  describe ':dock_plane' do

    it 'if hangar is not at capacity push plane into it' do
      airport = Airport.new()
      dummy_plane = double(:airport= => airport)
      airport.dock_plane(dummy_plane)
      expect(airport.hangar.length).to eq(1)
    end

    it 'if hangar is at capacity a runtime error should be raised' do
      airport = Airport.new(1)
      dummy_plane = double(:airport= => airport)
      airport.dock_plane(dummy_plane)
      expect { airport.dock_plane(dummy_plane) }.to raise_error(RuntimeError)
   
    end

  end

  describe ':release_plane' do

    it 'remove plane from hangar' do
      airport = Airport.new()
      dummy_plane = double(:airport= => airport)
      airport.dock_plane(dummy_plane)
      airport.release_plane(dummy_plane)
      expect(airport.hangar.length).to eq(0)
    end
  
  end

end
