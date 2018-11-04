require 'airport'
require 'plane'

describe Airport do
  it "tells you if Airport is full" do
  expect(subject).to respond_to(:is_full?)
  end
  it "prevents landing if airport is full" do
  gatwick = Airport.new
  expect { gatwick.green_light }.to raise_error "Airport is full"
  end
end
