require 'plane'

describe Plane do
  let(:airport) {double(:airport)}
  subject(:plane) {described_class.new}

context 'takes off and lands once cleared to do so' do
  before {allow(airport).to receive(:stormy?).and_return false }
  before {allow(airport).to receive(:check_plane_status) }
  before {allow(airport).to receive(:cleared_for_landing) }
  before {allow(airport).to receive(:planes) }
  before {allow(airport).to receive(:flying) }


  it 'takes off once cleared' do
    airport = Airport.new
    plane.land(airport)
    plane.request_takeoff(airport)
  end

   it 'lands once cleared' do
     airport = Airport.new
     plane.request_land(airport)
   end
end

   it 'raises an error if a plane tries to take off while already flying' do
     airport = Airport.new
     plane.land(airport)
     plane.takeoff(airport)
     expect{plane.request_takeoff(airport)}.to raise_error("Plane is already flying")
   end

   it 'raises an error if a plane tries to land while already grounded' do
     airport = Airport.new
     plane.land(airport)
     expect{plane.request_land(airport)}.to raise_error("Plane has already landed")
   end

  it 'raises an error if a plane tries to land while already grounded' do
    airport = Airport.new
    expect{plane.request_takeoff(airport)}.to raise_error("Plane is not in airport")
  end

  it 'is added to the airport once it has landed' do
    airport = Airport.new
    plane.land(airport)
    expect(airport.planes).to include(plane)
  end

  it 'is removed from the airport once it has taken off' do
    airport = Airport.new
    plane.takeoff(airport)
    expect(airport.planes).not_to include(plane)
  end

end
