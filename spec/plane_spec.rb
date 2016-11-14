require './lib/plane'

describe Plane do

  subject(:plane) { described_class.new }
  subject(:landed_plane) { described_class.new(false) }
  subject(:airport) { double :airport }

  it 'should assign a default of "flying"' do
    expect(plane.flying).to eq true
  end

  it 'changes a plane to flying false when it lands' do
    plane.land
    expect(plane.flying).to eq false
  end

  it 'change a plane to flying when it takes off' do
    landed_plane.take_off
    expect(landed_plane.flying).to eq true
  end

  it 'raises an error if plane is already flying' do
    allow(airport).to receive(:instruct_to_take_off)
    airport.instruct_to_take_off(plane)
    message = "Plane is already flying"
    expect { plane.take_off }.to raise_error message
  end

  it 'raises an error if plane has already landed' do
    message = "Plane has already landed"
    expect { landed_plane.land }.to raise_error message
  end

end
