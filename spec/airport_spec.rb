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
      allow(weather).to receive(:stormy?) { true }
      subject.receive(plane)
      expect { subject.depart(plane) }.to raise_error(RuntimeError, "Unsuitable conditions for takeoff")
    end
  end
  it 'can receive a plane' do
    subject.receive(plane)
    expect(subject.planes.length).to eq(1)
  end
end
