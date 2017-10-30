require 'airport.rb'

describe Airport do

  class FlyingPlane
  end

  class LandedPlane
    def flying?
      false
    end
  end

  class SunnyWeather
    def sunny?
      true
    end
  end

  class StormyWeather
    def sunny?
      false
    end
  end

  let(:plane) {FlyingPlane.new}
  let(:sunnyweather) {SunnyWeather.new}
  let(:stormyweather) {StormyWeather.new}
  let(:landed_plane) {LandedPlane.new}

  context "Checks Capacity" do
    it "Raise an error if the Airport is full" do
      expect { 52.times { subject.land(plane, sunnyweather.sunny?) } }.to raise_error("Cannot land, airport at capacity")
    end
    it "Lands the planes when above capacity" do
      expect(12.times { subject.land(plane, sunnyweather.sunny?).landed_planes.count }).to eq(12)
    end
    it "Lands all the planes up to the capacity" do
      expect(50.times { subject.land(plane, sunnyweather.sunny?).landed_planes.count }).to eq(50)
    end
  end

  context "When trying to land a plane" do
    it { expect(subject.landed_planes).to be_a(Array) }
    it 'Land a plane that is flying' do
      subject.land(plane, sunnyweather.sunny?)
      expect(subject.landed_planes[-1]).to be_a(FlyingPlane)
    end

    it "Doesn't land planes in stormy weather" do
      expect { subject.land(plane, stormyweather.sunny?) }.to raise_error("Cannot land or takeoff while stormy")
    end

    it "Doesn't land planes that are landed" do
      expect { subject.land(landed_plane, sunnyweather, landed_plane.flying?) }.to raise_error("Cannot land planes on the ground")
    end

  end

  context "When trying to takeoff" do
    it { expect(subject.land(plane, sunnyweather.sunny?).takeoff(sunnyweather.sunny?)).to be_a(FlyingPlane) }
    it "confirms that the plane is gone" do
      subject.land(plane, sunnyweather.sunny?).takeoff(sunnyweather.sunny?)
      expect(subject.landed_planes[-1]).to eq(nil)
    end
    it "Doesn't allow takeoff when the airport is empty" do
      expect { subject.takeoff(sunnyweather.sunny?) }.to raise_error("Cannot takeoff if there are no planes")
    end
    it "Doesn't allow planes to takeoff if stormy" do
      expect { subject.land(plane, sunnyweather.sunny?).takeoff(stormyweather.sunny?) }.to raise_error("Cannot land or takeoff while stormy")
    end
  end

end
