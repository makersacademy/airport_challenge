require "Airport"

describe Airport do

  it "responds to takeoff" do
  expect(subject).to respond_to :takeoff
  end

end
