require 'plane'

describe Plane do
  let(:airport) {double(:airport)}

  it 'takes off once cleared' do
    airport = Airport.new
    allow(airport).to receive(:cleared_for_takeoff)
    spy(subject.request_takeoff(airport))
  end

   it 'lands once cleared' do
     airport = Airport.new
     allow(airport).to receive(:cleared_for_landing)
     spy(subject.request_land(airport))
   end

  it 'is added to the airport once it has landed' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  it 'is removed from the airport once it has taken off' do
    airport = Airport.new
    subject.takeoff(airport)
    expect(airport.planes).not_to include(subject)
  end


end
