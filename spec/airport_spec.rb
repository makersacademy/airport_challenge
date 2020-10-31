require 'airport'

describe Airport do
  it "creates with a default capacity" do
    expect(subject.capacity).to eq(50)
  end

  it "creates with a custom capacity" do
    expect(Airport.new(400).capacity).to eq(400)
  end

  it "contains an array for planes to land, empty by default" do
    expect(Airport.new.planes).to eq([])
  end

  describe "#current_weather" do
    it "returns 'chill' or 'stormy'" do
      airport = Airport.new
      things_returned = []
      while things_returned.uniq.size < 2
        things_returned << airport.current_weather
      end
      expect(things_returned.uniq.size).to eq(2)
    end
  end
end
