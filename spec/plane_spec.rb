require 'plane'

describe Plane do
it "doesn't allow planes to land or takeoff in bad weather" do
  expect(subject.weather).to eq "Apologies due to bad weather you'll not be able to land!"
end
end

# end
