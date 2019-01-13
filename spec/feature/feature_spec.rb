require 'airport'

RSpec.describe 'full feature test for all user stories' do
  let(:small_airport) { Airport.new(1) }
  let(:stormy_airport) { Airport.new }
  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:plane3) { Plane.new }
  before(:each) do
    stormy_airport.land(plane3)
    small_airport.land(plane1)
    allow(small_airport).to receive(:stormy_weather?) { nil }
    allow(stormy_airport).to receive(:stormy_weather?) { true }
  end
  it 'feature test' do
    expect(small_airport.in_hanger?(plane1)).to be true
    expect { small_airport.land(plane1) }.to raise_error("Plane has already landed")
    expect { small_airport.land(plane2) }.to raise_error("Airport is full")
    expect(small_airport.take_off(plane1)).to be plane1
    expect(small_airport.in_hanger?(plane1)).to be false
    expect { small_airport.take_off(plane1) }.to raise_error("Plane not in hanger")
    expect { stormy_airport.land(plane2) }.to raise_error("Too stormy for landing")
    expect { stormy_airport.take_off(plane3) }.to raise_error("Too stormy for take off")
  end
end
