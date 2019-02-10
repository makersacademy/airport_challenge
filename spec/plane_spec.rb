require 'plane'
require 'airport'

describe Plane do

  let(:lear) { Plane.new }
  let(:gatwick) { Airport.new }
  let(:heathrow) { double :heathrow }

  it 'is actually a real Plane' do
    expect { Plane.new }.to_not raise_error
  end

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  it "knows it's landed after method call land" do
    lear.land(gatwick)
    expect(lear.status).to eq("Landed.")
  end

  it "knows it's back in the air after method call take_off" do
    lear.land(gatwick)
    lear.take_off
    expect(lear.status).to eq("Airbourne.")
  end

  it "knows where it's landed" do
    lear.land(gatwick)
    expect(lear.location).to eq(gatwick)
  end

  it "will not allow you to land a landed plane" do
    lear.land(gatwick)
    expect { lear.land(gatwick) }.to raise_error("Plane has already landed.")
  end

  it "will not allow you to take_off plane that's airbourne" do
    lear.land(gatwick)
    lear.take_off
    expect { lear.take_off }.to raise_error("Plane has left the hangar and is in the air.")
  end

  
end
