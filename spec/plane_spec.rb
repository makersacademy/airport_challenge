require 'plane.rb'
require 'airport.rb'
describe Plane do
  it 'should indicate it is flying if flying' do
    expect(subject.isflying?).to equal true
  end

  it 'should raise error when instructed to fly when already flying' do
    plane = Plane.new(false)
    plane.fly
    expect { plane.fly }.to raise_error "This plane is already in flight"
  end

  it 'should land when instructed to land should record the airport it has landed at' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    subject.land(airport)
    expect(subject.isflying?).to equal false
    expect(subject.landing_airport).to equal airport
  end

  it 'should raise error when instructed to land at an airport when when already landed there' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error "Plane already landed"
  end

  it 'should create a plane with a default flying status of true' do
    plane = Plane.new
    expect(plane.isflying?).to equal true
  end

  it 'should create a plane with specified flying status if passed in' do
    flyingstatus = false
    plane = Plane.new(flyingstatus)
    expect(plane.isflying?).to eq false
  end

  it 'should raise error when instructed to land at a different airport when already landed at another airport' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    subject.land(airport)
    another_airport = Airport.new
    allow(another_airport).to receive(:weathergood?) { true }
    expect { subject.land(another_airport) }.to raise_error "Plane at another airport"
  end

  it 'indicates if plane at airport' do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    plane.land(airport)
    expect(plane.plane_at_airport(airport)).to equal true
  end

  it 'indicates if plane at another airport' do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    another_airport = Airport.new
    allow(another_airport).to receive(:weathergood?) { true }
    plane.land(another_airport)
    expect(plane.plane_at_another_airport(airport)).to equal true
  end

end
