require 'airport'
require 'plane'

describe Airport do
  describe 'inspect docked planes' do
    it 'displays only the planes currently at the airport' do
      expect(subject.planes).to eq([])
      plane = instance_double('Plane')
      allow(plane).to receive(:land) {subject.accept(plane)}
      allow(plane).to receive(:take_off) {subject.release(plane)}
      plane.land(subject)
      expect(subject.planes).to eq([plane])
      plane.take_off
      expect(subject.planes).to eq([])
    end
  end

  it 'correctly reports when it is full' do
    5.times do
      expect(subject.full?).to eq(false)
      subject.accept(Plane.new)
    end
    expect(subject.full?).to eq(true)
  end
end
