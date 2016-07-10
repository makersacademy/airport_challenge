require 'airport'

describe Airport do

  let(:plane) {instance_double("Plane", land: true, take_off: false)}

  describe '#take_off' do

    it 'allows for planes to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "A plane has taken off!"
    end

    it 'raises an error when a plane not at the aiport tries to take off' do
      expect{subject.take_off(plane)}.to raise_error 'This plane is not at the airport!'
    end

  end

  describe '#land' do

    it 'allows for planes to land' do
      expect(subject.land(plane)).to eq "A plane has landed!"
    end

    it 'raises an error if a plane tries to land in a full airport' do
      Airport::DEAFAULT_CAPACITY.times {subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error 'Too many planes at this aiport!'
    end

    it 'raises an error if an already landed plane tries to land' do
      subject.land(plane)
      expect {subject.land(plane)}.to raise_error 'This plane has already landed!'
    end

  end

  describe '#build_plane' do

    it 'allows for building of new planes' do
      expect(subject.build_plane.last).to be_landed
    end

    it 'does not allow a plane to be built if capacity is reached' do
      subject.capacity.times {subject.land(Plane.new)}
      expect{subject.build_plane}.to raise_error 'Too many planes at this aiport!'
    end

  end

end
