require 'plane'

describe Plane do
  it "is flying or not" do
    expect(subject.flying?).to eq(true)
  end
end
