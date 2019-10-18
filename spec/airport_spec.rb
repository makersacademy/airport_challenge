require "airport"

describe Airport do
  airport = Airport.new
  it "is an instance of a Airport" do
    expect(airport).to be_a(Airport)
  end
end
