require 'plane'

describe Plane do

  before(:each) do
    @plane = Plane.new
  end

  it "Test for existance of a plane" do
    expect(subject).to be_a Plane
  end

end
