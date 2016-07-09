require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

describe 'planes at the airport' do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}
    it 'lands a plane' do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
   it 'is confirmed when a plane has landed' do
     airport.land(plane)
     expect(plane.landed?).to be true
   end
   it 'is confirmed when a plane has taken off' do
     airport.take_off(plane)
     expect(plane.landed?).to be false
   end
end
