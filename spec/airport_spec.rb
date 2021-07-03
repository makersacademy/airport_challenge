require 'airport'
require 'plane'

describe Airport do

  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:airport) { Airport.new }

  it 'is full' do
    allow(airport).to receive(:weather) { "sunny" }
    plane1.land(airport)
    plane2.land(airport)
    expect(airport.full?).to eq true
  end

  it { is_expected.to respond_to(:planes) }

  it 'knows which planes have landed' do
    allow(airport).to receive(:weather) { "sunny" }
    plane1.land(airport)
    expect(airport.planes).to eq([plane1])
  end

  it "can have its default capacity overridden" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end
end
