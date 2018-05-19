require 'airport'

describe Airport do

  let(:plane) {Plane.new}

  describe '#land' do
    it 'responds to land' do
      expect(subject).to respond_to(:land)
    end

    it 'lands a plane at an airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#take_off' do
    it 'responds to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'takes off from the airport and is no longer there' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'only takes off planes from an airport they are in' do
      expect{ subject.take_off(plane) }.to raise_error 'Plane is not at airport'
    end
  end
end
