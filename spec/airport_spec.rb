require 'airport'
require 'plane'

describe Airport do

  let(:lear) { Plane.new }
  let(:gatwick) { Airport.new }


  it 'is actually a real Airport' do
    expect { Airport.new }.to_not raise_error
  end

  it "registers a landed plane" do
    allow(gatwick).to receive(:stormy?) { false }
    lear.land(gatwick)
    expect(gatwick.hangar).to eq([lear])
  end

  it "knows when a plane has left the airport" do
    allow(gatwick).to receive(:stormy?) { false }
    lear.land(gatwick)
    lear.take_off
    expect(gatwick.hangar).to eq([])
  end

  it "only removes the take_off plane from the hangar" do
    allow(gatwick).to receive(:stormy?) { false }
    lear.land(gatwick)
    airbus = Plane.new
    airbus.land(gatwick)
    lear.take_off
    expect(gatwick.hangar).to eq([airbus])
  end

  it { is_expected.to respond_to :weather }

  it { is_expected.to respond_to :stormy? }

  it "randomly generates 'clear' or 'stormy' weather" do
    expect(Airport.new.weather).to eq("clear").or eq("stormy")
  end

  it "won't let a plane land in stormy conditions" do
    allow(gatwick).to receive(:stormy?) { true }
    expect{lear.land(gatwick)}.to raise_error("Landing prohibited due to weather conditions.")
  end

  it "won't let a plane take off in stormy conditions" do
    allow(gatwick).to receive(:stormy?) { true }
    lear.location = gatwick
    lear.status = "Landed."
    gatwick.hangar << lear
    expect{lear.take_off}.to raise_error("Takeoff prohibited due to weather conditions.")
  end

  it { is_expected.to respond_to :full? }

  it "has a maximum capacity of 20 planes" do
    expect(gatwick.capacity).to eq(20)
  end

  it "won't take more than 20 planes" do
    allow(gatwick).to receive(:stormy?) { false }
    20.times { Plane.new.land(gatwick) }
    expect { lear.land(gatwick) }.to raise_error("Airport full.")
  end

  it "can set the capacity of the airport to something other than 20" do
    stansted = Airport.new(50)
  end

end
