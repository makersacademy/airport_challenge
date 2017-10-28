require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "verify if #planes return an array" do
    expect(airport.planes).to be_an_instance_of(Array)
  end

  it "check if the plane in the airport after landing" do
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end

end
