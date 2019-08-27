require 'plane'

describe Plane do

  let(:gatwick) { Airport.new }
  let(:plane_1) { Plane.new }

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "confirms departure" do
    expect(plane_1.take_off).to eq("Confirming departure")
  end 

  it "raises error if in flight when asked to take off" do
    plane_1.take_off
    expect { plane_1.take_off }.to raise_error "Cannot take off - already in flight"
  end

  # it "raises error if not in flight when asked to land" do
  #   plane_1.land
  #   expect { plane_1.land }.to raise_error "Cannot land - not in flight"
  # end
end