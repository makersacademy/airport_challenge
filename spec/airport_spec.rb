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
    expect(gatwick.hangar).to eq([lear])
  end

  it "knows when a plane has left the airport" do
    lear.land(gatwick)
    lear.take_off
    expect(gatwick.hangar).to eq([])
  end

  it "only removes the take_off plane from the hangar" do
    lear.land(gatwick)
    airbus = Plane.new
    airbus.land(gatwick)
    lear.take_off
    expect(gatwick.hangar).to eq([airbus])
  end

  it { is_expected.to respond_to :weather }

  it "randomly generates weather 'clear' or 'stormy' " do
    expect(gatwick.weather).to eq("clear").or eq("stormy")
  end

  end
