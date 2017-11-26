require 'airport'

describe Airport do
  let(:plane) { double(:plane, takeoff: nil) }
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new weather }

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
      p subject
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.depart(plane) }.to raise_error(RuntimeError, "Unsuitable conditions for takeoff")
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
