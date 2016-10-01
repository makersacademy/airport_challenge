require 'plane'

describe Plane do

  it "creates a new instance of the Plane class" do
    expect(subject.is_a?(Plane)).to eq(true)
  end

  it "returns true to airborne method call" do
    expect(subject.airborne?).to eq(true)
  end

  xit "returns false to airborne method call" do

  end

end
