require 'airport'

describe 'Airport' do
  plane = Plane.new
  airport = Airport.new
  @weather = Weather.new
  describe '#planes' do
    it "return planes in the hanger" do


    end
  end

  describe '#land' do
    it "landed plane" do


    end
    it "raises error when stormy" do


    end
    it "raises error when hanger is full" do


    end
    it "raises error when plane already in the hanger" do


    end
  end

  describe '#take_off' do
    it "take off plane" do


    end
    it "raises error when stormy" do


    end
    it "raises error when plane is not in hanger" do


    end
  end
end
