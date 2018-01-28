require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:land).with(1).argument }
  # context "a plane is ready to land at an empty airport" do
  #   plane = Object.new
  #   # subject.land(plane)
  #   it "should store a plane in the airports planes variable" do
  #     expect(subject.plane).to eq plane
  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  it "stores a plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
  it { is_expected.to respond_to(:take_off) }
  it "lets a plane take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off
    expect(subject.plane).to eq nil
  end
  it { is_expected.to respond_to(:weather) }

  # it { is_expected.to respond_to(:stormy?) }

  # context "stormy weather" do
  #   let(:airport) { Airport.new }
  #   let(:plane) { Plane.new }
  #   it "should not let a plane land when weather is stormy" do
  #     airport.stormy? = true
  #     expect { airport.land(plane) }.to raise_error("The weather is too stormy to land")
  #   end
  # end

end
