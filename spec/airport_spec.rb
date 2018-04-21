require 'airport'

describe Airport do

  DEFAULT_CAPACITY = 2
  let(:plane) { double :plane, landed: false, land: true }
  let(:landed_plane) { double :plane, landed: true, take_off: false }
  let(:landed_plane_badweather) { double :plane, landed: true }
  let(:plane_prevent_land) { double :plane, landed: false }
  let(:weather) { double :weather, condition: 100 }

  describe '#initialize' do

    it 'sets default capacity when none is specified' do
      expect(subject.capacity).to eq DEFAULT_CAPACITY
    end

  end

  describe '#plane_lands' do

    it 'shows plane in airport once it lands' do
      subject.plane_lands(plane, weather)
      expect(subject.planes.include? plane).to eq true
    end

    it 'shows plane has not landed in airport due to bad weather conditions' do
      allow(weather).to receive(:condition) { 5 }
      expect { subject.plane_lands(plane_prevent_land, weather)
      }.to raise_error "Can't land: Bad weather conditions!"
      expect(subject.planes.include? plane_prevent_land).to eq false
    end

    it 'shows plane has not landed in airport when airport is full' do
      subject.planes.concat [landed_plane, landed_plane]
      expect { subject.plane_lands(plane_prevent_land, weather)
      }.to raise_error "Can't land: Airport is full!"
      expect(subject.planes.include? plane_prevent_land).to eq false
    end

  end

  describe '#plane_take_off' do

    it 'shows plane has left airport once it takes off in good weather' do
      subject.planes << landed_plane
      subject.plane_take_off(landed_plane, weather)
      expect(subject.planes.include? plane).to eq false
    end

    it 'shows plane has not left airport due to bad weather conditions' do
      subject.planes << landed_plane_badweather
      allow(weather).to receive(:condition) { 5 }
      expect { subject.plane_take_off(landed_plane_badweather, weather)
      }.to raise_error "Can't take off: Bad weather conditions!"
      expect(subject.planes.include? landed_plane_badweather).to eq true
    end
  end

end
