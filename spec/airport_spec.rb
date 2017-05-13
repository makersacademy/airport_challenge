require 'airport'

describe Airport do
  it "responds to #takeoff" do
    is_expected.to respond_to(:takeoff)
  end
end
