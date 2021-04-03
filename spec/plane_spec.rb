require "plane"

describe Plane do
  context "#land"
  it { is_expected.to respond_to :land }

  it "calling land sets flying variable to false" do
    subject.land
    expect(subject.flying?).to be false
  end
end
