require  "airport.rb"
describe Airport do
    
    it 'creates an instance of the class Airport' do
        expect(subject).to be_kind_of(Airport)
    end

    it 'defines a default capacity' do
        airport = Airport.new
        expect(airport.capacity).to eq_to(20)
    end

    it 'creates an airport with capacity' do
        airport = Airport.new(10)
        expect(airport.capacity).to eq_to(10)
    end

end
