require 'airport'

describe Airport do

  context 'Not in airport' do
    it "has a constant NOT_IN_AIRPORT, which is the string, 'Plane is not in this airport'" do
      expect(Airport::NOT_IN_THIS_AIRPORT).to eq 'Plane is not in this airport'
    end
  end

  context 'Not in airport' do
    it "has a constant ALREADY_AT_THIS_AIRPORT, which is the string, 'Plane is already at an airport!'" do
      expect(Airport::ALREADY_AT_THIS_AIRPORT).to eq 'Plane is already at an airport!'
    end
  end

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

  context '#plane?' do
    it 'return false if the  plane is in the an airport' do
      plane = double :plane
      expect(subject.plane?(plane)).to eq false
    end
    it 'return true if the  plane is in the an airport' do
      plane = double :plane
      subject.add_plane(plane)
      expect(subject.plane?(plane)).to eq true
    end
  end

  context ' #remove_plane' do
    it 'removes a plane from an airport' do
      plane = double :plane
      subject.add_plane(plane)
      expect(subject.remove_plane(plane)).to eq plane
    end

    it 'the removed plane is not in the list of planes anymore' do
      plane = double :plane
      subject.add_plane(plane)
      subject.remove_plane(plane)
      expect(subject.plane?(plane)).to eq false
    end

    it "doesn't remove plane that is not at the airport" do
      plane = double :plane
      expect { subject.remove_plane(plane) }.to raise_error Airport::NOT_IN_THIS_AIRPORT
    end

  end
end
