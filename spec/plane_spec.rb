require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land_at).with(1).argument }
  it { is_expected.to respond_to(:take_off_from).with(1).argument }

  it "confirms departure" do
    plane_1 = Plane.new
    Gatwick = Airport.new
    expect(plane_1.take_off_from(Gatwick)).to eq("Confirming departure from #{Gatwick}")
  end 
end 