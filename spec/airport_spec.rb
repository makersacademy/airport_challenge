require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:stormy?) }

  it "New airports should have a default capacity of 100" do
    expect(subject.capacity).to eq 100
  end

  it "It should be possible to override the default capacity of a new airport" do
    expect(Airport.new(130).capacity).to eq 130
  end
end
