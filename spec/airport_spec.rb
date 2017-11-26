require 'airport'

describe Airport do
  let(:plane) { double(:plane, takeoff: nil, land: nil) }
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new weather: weather }

  it 'has a default capacity' do
    expect(subject.max_capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
  it 'has a variable capacity' do
    expect(Airport.new(weather: weather, max_capacity: 30).max_capacity).to eq(30)
  end
  describe '#depart' do
    it 'can depart a plane' do
      expect(subject).to respond_to(:depart).with(1).argument
    end
    it 'confirms plane has departed' do
      subject.receive(plane)
      subject.depart(plane)
      expect(subject.find_plane(plane)).to be false
    end
    it 'does not depart planes not found' do
      expect { subject.depart(plane) }.to raise_error(RuntimeError, "Plane not found at this Airport")
    end
    it 'does not depart planes in stormy weather' do
      subject.receive(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.depart(plane) }.to raise_error(RuntimeError, "Unsuitable conditions for takeoff")
    end
    it 'does not receive planes when full' do
      20.times { subject.receive(plane) }
      expect { subject.receive(plane) }.to raise_error(RuntimeError, "Airport full, unable to receive plane")
    end
  end
  describe '#receive' do
    it 'does not allow plane to land in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.receive(plane) }.to raise_error(RuntimeError, "Unsuitable conditions for landing")
    end
    it 'can receive a plane' do
      subject.receive(plane)
      expect(subject.planes.length).to eq(1)
    end
  end
end
