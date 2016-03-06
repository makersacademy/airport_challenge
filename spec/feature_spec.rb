require_relative "../lib/airport"

=begin
heathrow = Airport.new(capacity: 50)
frankfurt = Airport.new(capacity: 70)
schiphol = Airport.new

ba = Plane.new(heathrow)
lufthansa = Plane.new(frankfurt)
klm = Plane.new(schiphol)

describe "initializing airports" do
  it "has the default capacity" do
    expect(schiphol.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should accept new capacity" do
    expect(frankfurt.capacity).to eq 70
  end

  it "should accept new capacity" do
    expect(heathrow.capacity).to eq 50
  end
end

describe "initializing planes" do
  [ba, lufthansa, klm].each do |plane|
    it "#{plane} starts in the airport" do
      expect(plane.flying).to eq false
    end
  end
end

describe "take-off" do

end
=end
