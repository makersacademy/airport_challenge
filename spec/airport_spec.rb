require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  it "can land a plane" do
    expect(airport).to respond_to(:land)
  end

end