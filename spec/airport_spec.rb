require 'airport'
describe Airport do
    let(:an_airport) { Airport.new }
    context 'is empty' do
        it ".land('plane')" do
            an_airport.land('plane')
            expect(an_airport.planes.length).to eq(1)
        end
    end        
end
