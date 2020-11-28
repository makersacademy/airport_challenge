require "airport"

describe Airport do
  it "can create an instance of Airport and assign to new variable" do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end