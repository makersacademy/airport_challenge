# Final Version

require "plane"
require "airport"

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it "successfully instantiates the plane class" do
    expect(plane).to be_instance_of(Plane)
  end

  it { is_expected.to respond_to :flying? }

  it { is_expected.to respond_to :landed! }

  it { is_expected.to respond_to :take_off! }

  it { is_expected.to respond_to :airborne? }

  it "has a flying status of false when created" do
    expect(plane.flying?).to eq(false)
  end

  it "has a flying state of landed when created" do
    expect(plane.airborne?).to eq("Landed")
  end

  it "has a flying status of true when in the air" do
    plane.take_off!
    expect(plane.flying?).to eq(true)
  end

  it "has a flying state of flying when in the air" do
    plane.take_off!
    expect(plane.airborne?).to eq("Flying")
  end

  it "has a flying status of false when landed" do
    plane.landed!
    expect(plane.flying?).to eq(false)
  end

  it "has a flying state of landed when created" do
    plane.landed!
    expect(plane.airborne?).to eq("Landed")
  end
end
