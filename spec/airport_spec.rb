require 'airport'

describe Airport do
  describe 'full?' do
    it "checks if airport is full" do
      plane = Plane.new
      plane.land
      expect(subject.full?).to eq TrueClass
    end
  end
end