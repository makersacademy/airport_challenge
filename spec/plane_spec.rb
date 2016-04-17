require 'plane'

describe Plane do
  let(:airport) {double(:airport)}

  it 'takes off once cleared' do
    airport = Airport.new
    subject.land(airport)
    allow(airport).to receive(:stormy?) {false}
    subject.request_takeoff(airport)
  end

   it 'lands once cleared' do
     airport = Airport.new
     allow(airport).to receive(:stormy?) {false}
     subject.request_land(airport)
   end

   it 'raises an error if a plane tries to take off while already flying' do
     airport = Airport.new
     subject.land(airport)
     subject.takeoff(airport)
     expect{subject.request_takeoff(airport)}.to raise_error("Plane is already flying")
   end

   it 'raises an error if a plane tries to land while already grounded' do
     airport = Airport.new
     subject.land(airport)
     expect{subject.request_land(airport)}.to raise_error("Plane has already landed")
   end

  it 'raises an error if a plane tries to land while already grounded' do
    airport = Airport.new
    expect{subject.request_takeoff(airport)}.to raise_error("Plane is not in airport")
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
