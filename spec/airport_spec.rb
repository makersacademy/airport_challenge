require 'airport'

describe Airport do
  describe '#initialize' do
    it 'creates an empty airport' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end


  describe '#take_off' do
    it 'instructs a plane to leave the airport and confirm' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} is no longer at the airport"
    end
  end
end
