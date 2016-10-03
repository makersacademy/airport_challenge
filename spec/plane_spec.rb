require 'plane'

describe Plane do

  before(:each) do
    @plane = Plane.new
  end

  it "Existential plane" do
    expect(subject).to be_a Plane
  end

end
