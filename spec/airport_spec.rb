require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'returns a success message when we land a plane' do
      expect(subject.land(Plane.new)).to eq "Plane landed"
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to :planes }

    it 'returns no planes when airport is empty' do
      expect(subject.planes).to eq nil
    end

    it 'returns a plane when I check what has landed' do
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.planes).to eq my_plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'returns a confirmation that the plane has taken off' do
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.take_off(my_plane)).to eq ("Successful take off")
    end

    it 'raises an error if I try to make a non-existent plane take off' do
      my_plane = Plane.new
      subject.land(my_plane)
      expect{ subject.take_off(Plane.new) }.to raise_error "That plane isn't at the airport"
    end
  end
end
