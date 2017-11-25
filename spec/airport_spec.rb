require 'airport'

describe Airport do
  let(:plane) { double(:plane, takeoff: nil) }
  describe '#depart' do
    it 'can depart a plan' do
      expect(subject).to respond_to(:depart).with(1).argument
    end
    it 'confirms plane has departed' do
      subject.receive(plane)
      subject.depart(plane)
      expect(subject.find_plane(plane)).to be false
    end
  end
  it 'can receive a plane' do
    subject.receive(plane)
    expect(subject.planes.length).to eq(1)
  end
end
