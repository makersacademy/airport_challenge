require 'plane'

describe Plane do

  let(:gatwick) { Airport.new }
  let(:plane_1) { Plane.new }

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off_from).with(1).argument }

  it "confirms departure" do
    expect(plane_1.take_off_from(gatwick)).to eq("Confirming departure from #{gatwick}")
  end 

end