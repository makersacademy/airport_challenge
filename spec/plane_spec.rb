require 'plane'

describe Plane do
  it "makes planes on the ground" do
    expect(subject.location).to be_a(Airport)
  end
end
