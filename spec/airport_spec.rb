require 'airport.rb'

describe Airport do

  describe 'capacity' do

    it 'default capacity should be replaced if airport is initialized with an argument' do
      airport = Airport.new(50)
      expect(airport.hangar.length).to eq(50)
    end
  
  end

end
