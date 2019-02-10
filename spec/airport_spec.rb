require 'airport'
require 'plane'

describe Airport do

  let(:lear) { Plane.new }
  let(:gatwick) { Airport.new }

  it 'is actually a real Airport' do
    expect { Airport.new }.to_not raise_error
  end

  it "registers a landed plane" do
    lear.land(gatwick)
    expect(gatwick.landed_planes).to eq([lear])
  end

  it "knows when a plane has left the airport" do
    lear.land(gatwick)
    expect(gatwick.landed_planes).to eq([])
  end

end
