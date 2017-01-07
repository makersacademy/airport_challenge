require 'plane'

describe Plane do

  it "can land into the airport" do
  expect(subject).to respond_to(:land)
  end

  it "confirms when it has landed" do
  expect(subject.land).to eq "Plane has landed"
  end
end
