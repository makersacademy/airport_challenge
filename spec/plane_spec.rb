require 'plane'

describe Plane do
  it "responds to #flying?" do
    is_expected.to respond_to(:flying?)
  end
  it "has a default value flying set to false" do
    expect(subject.flying?).to eq false
  end
end
