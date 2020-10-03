require 'Airport.rb'
describe Airport do

    it 'airport can be named' do
      new_airport = Airport.new("Hamburg")
      expect(new_airport.name).to eq("Hamburg")
    end

    it 'plane array empty' do
      new_airport = Airport.new("Hamburg")
      expect(new_airport.planes_in_airport).to eq([])
    end

    it 'default airport capacity = 5' do
      new_airport = Airport.new("Hamburg")
      expect(new_airport.capacity).to eq(5)
    end
end
