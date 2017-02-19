require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'confirms that a plane has landed' do
      expect(subject.land_plane(Plane.new)).to eq true
    end

    it 'checks if a plane has been added to the airports planes array after you land a plane' do
      subject.land_plane(Plane.new)
      expect(subject.planes[0]).to be_a Plane
    end

    it 'raises an error if a plane tries to land while it is stormy' do
      subject.set_weather_stormy
      expect{subject.land_plane(Plane.new)}.to raise_error "Weather is stormy, plane cannot land."
    end
  end

  describe '#plane_take_off' do
    it 'confirms that a plane has taken off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.plane_take_off(plane)).to eq true
    end

    it 'raises an error if a plane that is not in the airport tries to take off' do
      expect{subject.plane_take_off(Plane.new)}.to raise_error "That plane is not in the airport."
    end
  end

  describe '#stormy or calm' do
    it 'changes the weather to stormy' do
      expect(subject.set_weather_stormy).to eq true
    end

    it 'changes the weather to calm' do
      subject.set_weather_stormy
      expect(subject.set_weather_calm).to eq false
    end
  end
end
