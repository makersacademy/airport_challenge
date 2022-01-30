require_relative '../lib/plane'

describe Plane do
  describe '#airbourne?' do
    it "responds to airbourne? when grounded" do
      plane = Plane.new("grounded")
      expect(plane.airbourne?).to eq false
    end  
    it "responds to airbourne? when airbourne" do
      plane = Plane.new("airbourne")
      expect(plane.airbourne?).to eq true
    end  
  end

  describe '#grounded?' do
    it "responds to grounded? when airbourne" do
      plane = Plane.new("airbourne")
      expect(plane.grounded?).to eq false
    end  
    it "responds to grounded? when grounded" do
      plane = Plane.new("grounded")
      expect(plane.grounded?).to eq true
    end  
  end
end
