require 'plane'

describe Plane do
  
  it { is_expected.to be_a Plane }

  it { is_expected.to respond_to :on_ground }

  it "can report its current (default) location" do
    expect(subject.on_ground).to be false
  end

  it { is_expected.to respond_to(:report_location).with(1).argument }

  it "can change its current location" do
    subject.report_location(true)
    expect(subject.on_ground).to be true
  end

end
