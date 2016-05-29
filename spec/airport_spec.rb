require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it '#set_capacity sets capacity correctly' do
    airport.set_capacity(10)
    expect(airport.capacity).to eq(10)
    expect(airport.set_capacity(-5)).to eq("Capacity must be greater than 0")
  end

  it '#accept_plane accepts a plane to land when not at capacity' do
    expect(airport.accept_plane(plane)).to eq true
    expect(airport.planes).to eq([plane])
    airport.set_capacity(1)
    expect(airport.accept_plane(plane)).to eq("Airport already at capacity")
  end

end