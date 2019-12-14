require "airport"

describe Airport do
  it "expects Airport to make working airports" do
    airport = Airport.new
    expect(airport).to eq airport
  end

  it "expects airport to respond to plane_landing method" do
    expect(subject).to respond_to(:plane_land)
  end
end
