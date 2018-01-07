require 'airport'

describe 'Plane takeoff tests' do

   it 'should let plane takeoff and confirm its left airport' do
     plane = Plane.new
     gatwick = Airport.new
     allow(gatwick.weather).to receive(:stormy?).and_return(false)
     gatwick.land(plane)
     gatwick.takeoff

     expect(gatwick.in_airport?(plane)).to eq false
   end

end
