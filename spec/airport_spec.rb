require 'airport'

describe Airport do

  it "instructs a plane to land at an airport" do
    expect(subject).to respond_to(:land)
  end

end
