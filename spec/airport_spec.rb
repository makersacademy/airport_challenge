require 'airport'

describe Airport do

  context '#add_plane' do
    it 'adds a plane to an airport' do
      plane = double :plane
      expect(subject.add_plane(plane)).to eq plane
    end

    it 'keeps the list of added planes' do
      plane1 = double :plane1
      plane2 = double :plane2
      plane3 = double :plane3
      subject.add_plane(plane1)
      subject.add_plane(plane2)
      subject.add_plane(plane3)
      expect(subject.planes).to eq [plane1, plane2, plane3]
    end

    it 'fails to add a plane twice' do
      plane = double :plane
      subject.add_plane(plane)
      expect { subject.add_plane(plane) }.to raise_error 'Plane is already at an airport!'
    end

  end

end
