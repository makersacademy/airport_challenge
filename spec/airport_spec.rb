require "airport"
require "plane"

describe Airport do
  it "tells us the capacity of the airport" do
    expect(subject).to respond_to(:capacity)
  end

end
