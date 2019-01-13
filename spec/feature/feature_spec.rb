require 'airport'
require 'plane'

RSpec.describe 'all objects and methods' do
  let(:small_airport) { Airport.new(1) }
  let(:stormy_airport) { Airport.new }
  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:plane3) { Plane.new }
  before(:each) do
    # Allow sunny weather and land plane for take off test
    allow(small_airport).to receive(:stormy?) { nil }
    small_airport.land(plane1)
    # Allow sunny weather, land plane for take off test then make this airport stormy
    allow(stormy_airport).to receive(:stormy?) { nil }
    stormy_airport.land(plane3)
    allow(stormy_airport).to receive(:stormy?) { true }
  end
  it 'feature test' do
    expect(small_airport.in_hanger?(plane1)).to be true
    expect { small_airport.land(plane3) }.to raise_error("Plane is not in air")
    expect { small_airport.land(plane1) }.to raise_error("Plane has already landed")
    expect { small_airport.land(plane2) }.to raise_error("Airport is full")
    expect(small_airport.take_off(plane1)).to be plane1
    expect(small_airport.in_hanger?(plane1)).to be false
    expect { small_airport.take_off(plane1) }.to raise_error("Plane not in hanger")
    expect { stormy_airport.land(plane2) }.to raise_error("Too stormy for landing")
    expect { stormy_airport.take_off(plane3) }.to raise_error("Too stormy for take off")
  end
end
