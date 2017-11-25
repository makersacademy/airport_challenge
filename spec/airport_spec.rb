require 'airport'

describe Airport do
  let(:plane) { double(:plane, takeoff: nil) }
  describe '#depart' do
    it 'can depart a plan' do
      subject.depart(plane)
      expect(subject.find_plane(plane)).to be(false)
    end
    it 'raises error when plane not departed' do
      subject.depart(plane)
      subject.planes << plane
      
    end
  end
end
