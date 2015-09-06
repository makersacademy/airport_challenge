require 'airport'

describe Airport do
  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:launch_plane)
    end

    it 'releases a plane' do
      plane=double(:plane, land: :landed, take_off: :flying)
      subject.land_plane(plane)
      subject.launch_plane(plane)
      expect(subject.launch_plane(plane)).to eq([])
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'receives a plane' do
      plane=double(:plane, land: :landed, take_off: :flying)
      expect(subject.land_plane(plane)).to eq([plane])
    end
  end

  describe 'traffic control' do

    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane=double(:plane, land: :landed, take_off: :flying)
        subject.read_capacity.times{subject.land_plane(plane)}
        expect { subject.land_plane(plane) }.to raise_error 'Do not land, airport is full'
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane=double(:plane, land: :landed, take_off: :flying)
        allow(subject).to receive(:report_weather).and_return(:stormy)
        expect { subject.launch_plane(plane) }.to raise_error 'Weather is stormy, do not take off'
      end

      it 'does not allow a plane to land' do
        plane=double(:plane, land: :landed, take_off: :flying)
        allow(subject).to receive(:report_weather).and_return(:stormy)
        expect { subject.land_plane(plane) }.to raise_error 'Weather is stormy, do not land'
      end
    end
  end
end
