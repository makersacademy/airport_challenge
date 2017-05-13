require 'airport'

describe Airport do
  it "responds to #land" do
    is_expected.to respond_to(:land)
  end
end
