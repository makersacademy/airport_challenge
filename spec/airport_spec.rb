require 'classes'

describe Airport do
  it "creates an airport" do
    expect(Airport.new).to be_an_instance_of Airport
  end
end
