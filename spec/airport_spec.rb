require 'airport'
require 'plane_file'

describe Airport do
  describe '#land(plane_name)' do
    it 'instructs a plane to land' do
      plane = double("plane")
      subject.land(plane)
      expect(subject.which_planes).to eq [plane]
    end

    it 'testing multiple planes to land' do
      plane = double("plane")
      3.times { subject.land(plane) }
      expect(subject.which_planes).to eq [plane, plane, plane]
    end
  end

  describe '#landed?()' do
    it 'checks if a plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end
  end
end
