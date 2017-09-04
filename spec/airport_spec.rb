require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  subject { described_class.new(capacity: 20) }
  let(:plane) { Plane.new }

  it { is_expected.to(respond_to(:land).with(1).argument) }
  it { is_expected.to(respond_to(:take_off).with(1).argument) }

  it 'Starts with no planes created' do
    expect(subject.plane_count).to eq 0
  end

  describe '#landing' do
    it 'allows planes to land' do
      plane.land?
      expect { subject.land(plane) }.to change { subject.plane_count }.by 1
    end

    it 'Planes not allowed to land when airport full' do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error(RuntimeError, 'Planes cannot land: airport full')
    end
  end

  describe 'take_off' do
    it 'allows planes take off' do
      subject.land(plane)
      expect { subject.take_off(plane) }.to change { subject.plane_count }.by(-1)
    end

    it 'Planes cannot take off that are not at airport' do
      subject.full?
      expect { subject.take_off(plane) }.to raise_error(RuntimeError, 'Planes cannot take off: airport empty')
    end
  end
end
