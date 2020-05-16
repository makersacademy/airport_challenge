require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  xit "#land" do
    airport = subject.land
    expect(subject.land).to eq airport.with
  end

  # it "take off from airport" do
  #   expect(subject.take)
  # end
end
