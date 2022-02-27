require 'airport'

describe Airport do
  describe "capacity changer" do
    it "allows you to change the capacity of an airport" do
      airport_1 = Airport.new
      expect(airport_1.capacity).to eq 5
      airport_1.capacity = 2
      expect(airport_1.capacity).to eq 2
    end
  end
end