require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to :capacity }
  it 'adds plane to bunker when landed' do
    plane = Plane.new
    airport.land(plane)
    expect(airport.bunker.length).to eq(1)
  end
  it 'removes plane from bunker when taking off' do
    2.times do
      plane = Plane.new
      airport.land(plane)
    end
    plane = Plane.new
    airport.takeoff(plane)
    expect(airport.bunker.length).to eq(1)
  end

end
