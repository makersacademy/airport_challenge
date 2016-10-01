require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
      it { is_expected.to respond_to(:land).with(1).argument }

      it 'lands a plane at the airport' do
        plane = Plane.new
        expect(subject.land(plane)).to be subject
        end
      end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a plane to take off from the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to be plane
    end
  end

  describe '#planes' do
    it 'confirms a landed plane is at the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'confirms a plane has taken off and is no longer at the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end
  end
end
