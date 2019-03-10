require "plane"

describe Plane do
  it { is_expected.to respond_to(:location) }
  it "can change location attribute using location attr_accessor" do
    subject.location = "test"
    expect(subject.location).to eq "test"
  end
end
