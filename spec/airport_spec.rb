require 'airport'

describe Airport do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :hangar_count }

  describe '#land method' do

    it "puts the plane in the Airport" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end

    it "throws an error when airport.land is called and the @hangar is at capacity" do
      airport = Airport.new
      expect { 21.times { airport.land Plane.new } }.to raise_error("Airport at Capacity!")
    end

  end

  describe '#take_off method' do

    it "allows the plane to take_off" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect { airport.take_off(plane) }.to change { airport.hangar.count }.by(-1)
    end

  end

end
