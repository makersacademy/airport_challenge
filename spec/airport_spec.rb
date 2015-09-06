require 'airport'

describe Airport do
  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:launch_plane)
    end

    it 'releases a plane' do
      plane=double(:plane, land: :landed, take_off: :flying, status: :flying)
      allow(subject).to receive(:report_weather).and_return(:sunny)
      subject.land_plane(plane)
      allow(plane).to receive(:status).and_return(:landed)
      expect(subject.launch_plane(plane)).to eq([])
    end

    it 'does not release a plane that is not here' do
      allow(subject).to receive(:report_weather).and_return(:sunny)
      p1=double(:plane, land: :landed, take_off: :flying, status: :flying)
      p2=double(:plane, land: :landed, take_off: :flying, status: :flying)
      subject.land_plane(p1)
      error_st='Plane is not here'
      expect{subject.launch_plane(p2)}.to raise_error error_st
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'receives a plane' do
      allow(subject).to receive(:report_weather).and_return(:sunny)
      p=double(:plane, land: :landed, take_off: :flying, status: :flying)
      expect(subject.land_plane(p)).to eq([p])
    end

    it 'does not land a landed plane' do
      allow(subject).to receive(:report_weather).and_return(:sunny)
      p=double(:plane, land: :landed, take_off: :flying, status: :landed)
      error_st='Plane has already landed'
      expect{subject.land_plane(p)}.to raise_error error_st
    end
  end

  describe 'traffic control' do

    context 'when airport is full' do
      it 'does not allow a plane to land' do
        p=double(:plane, land: :landed, take_off: :flying, status: :flying)
        subject.capacity.times{subject.land_plane(p)}
        error_st='Do not land, airport is full'
        expect { subject.land_plane(p) }.to raise_error error_st
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane=double(:plane, land: :landed, take_off: :flying)
        allow(subject).to receive(:report_weather).and_return(:stormy)
        error_st='Weather is stormy, do not take off'
        expect { subject.launch_plane(plane) }.to raise_error error_st
      end

      it 'does not allow a plane to land' do
        plane=double(:plane, land: :landed, take_off: :flying)
        allow(subject).to receive(:report_weather).and_return(:stormy)
        error_st='Weather is stormy, do not land'
        expect { subject.land_plane(plane) }.to raise_error error_st
      end
    end
  end
end
