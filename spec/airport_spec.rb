require 'airport'

describe Airport do

  describe '#arrival' do

    it 'accepts a plane and adds it to the ground_fleet' do
      plane = double :plane
      subject.arrive(plane)
      expect(subject.ground_fleet).to eq [plane]
    end

    it 'raises an error when at capacity' do
      plane = double :plane
      subject.capacity.times { subject.arrive(plane) }
      expect { subject.arrive(plane) }.to raise_error('The ground fleet is at capacity')
    end

  end

  describe '#departure' do

    it 'lets a plane takeoff and removes from ground fleet' do
      plane = double :plane
      subject.ground_fleet << plane
      expect(subject.depart).to eq plane
    end

    it 'raises an error if no planes in ground fleet' do
      expect { subject.depart }.to raise_error('No planes available in ground fleet')
    end

  end

  describe '#full?' do
    it 'should be true when ground_fleet at capacity' do
      subject.capacity.times{subject.arrive(double :plane)}
      expect(subject).to be_full
    end
  end

  describe '#empty?' do
    it 'should be true when ground fleet empty' do
      expect(subject).to be_empty
    end
  end

end
