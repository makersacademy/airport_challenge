require 'airport'

describe Airport do

  describe '#land_plane' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'should note that landed planes are landed' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(plane).to be_landed
    end

    it 'should place planes on the [runway] when landing' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.runway.include?(plane)).to eq true
    end

    it 'should not allow planes already on the [runway] to land again' do
      plane = Plane.new
      subject.land_plane(plane)
      expect{subject.land_plane(plane)}.to raise_error "This plane has already landed"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'should note that in-flight planes are not landed' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(plane).to_not be_landed
    end

    it 'should remove planes from the [runway] on #take_off' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(subject.runway.include?(plane)).to eq false
    end

    it 'should only allow planes to take off if they are on the [runway]' do
      plane = Plane.new
      expect{subject.take_off(plane)}.to raise_error "This plane is not in the airport"
    end
  end

end
