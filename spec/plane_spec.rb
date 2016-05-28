require 'plane'

describe Plane do

  let(:plane) { Plane.new("Plane1") }

  it "can initialize a new plane" do
    expect(subject).to be_a(Plane)
  end



end
