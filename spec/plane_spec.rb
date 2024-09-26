require 'plane'
require 'airport'
require 'weather'
 describe Plane do
   let(:plane) { Plane.new }
   let(:airport) { Airport.new }
   context '#land' do
     it { is_expected.to respond_to :land }

     it 'plane starts on the ground' do
       plane = Plane.new
       expect(plane.flying).to eq false
     end

     it 'lands the plane' do
       plane = Plane.new
       plane.land
       expect(plane.flying).to eq false
     end

     it 'lands 1 plane in an airport' do
       plane = Plane.new
       airport = Airport.new
       plane.land(airport)
       expect(airport.planes).to eq plane
     end
   end

   context '#take_off' do
     it 'takes_off from the airport' do
       plane = Plane.new
       plane.take_off
       expect(plane.flying).to eq true
     end
   end
 end
