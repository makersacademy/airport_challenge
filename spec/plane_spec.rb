require 'plane'

describe Plane do
  it "checks if plane is docked" do
    expect(subject.docked).to eq false
  end
end