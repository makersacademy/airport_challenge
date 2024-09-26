require 'airport'

describe Airport do
  subject(:airport) { Airport.new(weather) }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather, :get_weather => :sunny) }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :is_parked? }

  context '#land' do
    it 'check that land saves the plane' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'does not land if stormy' do
      allow(weather).to receive(:get_weather) { :stormy }
      expect { subject.land(plane) }.to raise_error 'Cannot land if not sunny'
    end
  end

  context '#take_off' do
    it 'allows the plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'allows a ready plane to take off' do
      plane1 = double(:plane)
      plane2 = double(:plane)
      plane3 = double(:plane)
      subject.land(plane1)
      subject.land(plane2)
      subject.land(plane3)
      subject.take_off(plane2)
      expect(subject.planes).not_to include(plane2)
    end

    it 'does not take off if stormy' do
      subject.land(plane)
      allow(weather).to receive(:get_weather) { :stormy }
      expect { subject.take_off(plane) }.to raise_error 'Cannot take off it not sunny'
    end
  end
  context '#is_parked?' do
    it 'is parked' do
      subject.land(plane)
      expect(subject.is_parked?(plane)).to eq true
    end
    it 'is not parked' do
      expect(subject.is_parked?(plane)).to eq false
    end
  end




end
