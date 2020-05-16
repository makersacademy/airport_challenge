require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  # it "take off from airport" do
  #   expect(subject.take_off).to eq ""
  # end
end
