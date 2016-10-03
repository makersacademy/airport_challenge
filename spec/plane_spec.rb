require 'plane'

describe Plane do

  it { is_expected.to respond_to(:in_air) }

  it "creates a plane" do
    expect(described_class).to eq Plane
  end

end
