require "airport"
require "plane"

describe Airport do
  describe '#land' do
    it "lands at a aiport" do
      eva_air = Airport.new
      expect(eva_air.land(Plane.new)).to eq true
    end
    it "raise error if airport is full" do
      eva_air = Airport.new
      expect{ 11.times{eva_air.land(Plane.new)}}.to raise_error(fail)
    end
  end
  describe '#take_off' do
    it "confirms the plane is no longer at the airport" do
      eva_air = Airport.new
      expect{eva_air.take_off(Plane.new)}.to output("Plane has taken off\n").to_stdout
    end
  end
end
