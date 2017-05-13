require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument  }
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument  }
  it { is_expected.to respond_to(:weather) }

  describe '#stormy?' do
    it 'can check if weather is stormy' do
      expect(subject.stormy?).to satisfy { |stormy| stormy == true || stormy == false}
    end
  end

  describe '#land_plane' do
    it 'should allow plane to land at airport' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq "#{plane} has completed landing"
    end

    it 'should only allow airborne planes to land' do
      plane = Plane.new
      subject.land_plane(plane)
      expect{subject.land_plane(plane)}.to raise_error{"Plane is already landed"}
    end

    it 'should confirm that plane has landed' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(plane.airborne?).to eq false
    end

    #it 'should not allow plane to land when stormy' do
    #  plane = Plane.new
    #  subject.weather.is_stormy
    #end
  end

  describe '#takeoff_plane' do
    it 'should allow plane to takeoff from airport' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.takeoff_plane(plane)
      expect(plane).to be_airborne
    end

    it 'should only allow landed planes to takeoff' do
      plane = Plane.new
      expect{subject.takeoff_plane(plane)}.to raise_error{"Plane is already airborne"}
    end

    it 'should confirm that plane has taken off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane(plane)).to eq "#{plane} has taken off"
    end

    #it 'allows planes to takeoff from only airports they are landed in' do
    #  airport1 = Airport.new
    #  airport2 = Airport.new
    #  plane = Plane.new
    #  airport1.land_plane(plane)
    #  expect{airport2.takeoff_plane(plane)}.to raise_error{"PLANE"}
    #end


  end

end
