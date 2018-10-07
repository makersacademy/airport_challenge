require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do

  let(:flying_plane) { double(:plane, flying?: true) }
  let(:landed_plane) { double(:plane, flying?: false) }
  let(:sunny_weather) {double(:weather, stormy?: false) }
  let(:stormy_weather) {double(:weather, stormy?: true) }

  describe "#land" do
    it 'should land a plane at an airport' do
      allow(flying_plane).to receive(:landed)
      expect { subject.land(flying_plane, weather).to_not raise_error }
    end

    it 'instructs a plane to land and confirms plane is at the airport' do
      allow(flying_plane).to receive(:landed)
      subject.land(flying_plane, sunny_weather)
      expect(subject.landed_planes).not_to be_empty
    end

    it 'a plane does not land if weather is stormy' do
      allow(flying_plane).to receive(:landed)
      expect { subject.land(flying_plane, stormy_weather) }.to raise_error "Cannot land, Weather is stormy"
    end

    it 'raises an error when airport is full' do
      allow(flying_plane).to receive(:landed)
      subject.capacity.times { subject.land(flying_plane, sunny_weather) }
      expect { subject.land(flying_plane, sunny_weather) }.to raise_error "Airport is full"
    end

    it 'raises an error when plane has already landed' do
      expect { subject.land(landed_plane, sunny_weather) }.to raise_error "Plane has already landed"
    end
  end

  describe "#takeoff" do
    it 'instructs a plane to take off and confirms plane is no longer there' do
      allow(landed_plane).to receive(:takenoff)
      subject.landed_planes << landed_plane
      subject.takeoff(landed_plane, sunny_weather)
      expect(subject.landed_planes).to be_empty
    end

    it 'a plane does not take off if weather is stormy' do
      allow(landed_plane).to receive(:takenoff)
      expect { subject.takeoff(landed_plane, stormy_weather) }.to raise_error "Cannot takeoff, Weather is stormy"
    end

    it 'raises an error when there are no planes' do
      allow(landed_plane).to receive(:takenoff)
      expect { subject.takeoff(landed_plane, sunny_weather) }.to raise_error "No planes available"
    end

    it 'raises an error when plane has already takenoff' do
      allow(flying_plane).to receive(:landed)
      subject.land(flying_plane, sunny_weather)
      expect { subject.takeoff(flying_plane, sunny_weather) }.to raise_error "Plane has already takenoff"
    end
  end
end
