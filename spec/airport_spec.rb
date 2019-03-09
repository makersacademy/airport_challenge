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
      expect(subject.take_off(my_plane)).to eq "Successful take off"
    end

    it 'raises an error if I try to make a non-existent plane take off' do
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.take_off(Plane.new) }.to raise_error "That plane isn't at the airport"
    end

    it 'should confirm that the plane that has just taken off is no longer at the airport' do
      my_plane = Plane.new
      subject.land(my_plane)
      subject.take_off(my_plane)
      expect(subject.airport_planes).not_to eq my_plane
    end
  end

  describe '#check_weather' do
    it { is_expected.to respond_to(:check_weather) }

    it 'should return either Sunny or Stormy' do
      expect(subject.check_weather).to satisfy { |result| result = "Sunny" || result = "Stormy" }
    end

    it 'should stop a plane from taking off when the weather is Stormy' do
      allow(subject).to receive(:check_weather) { "Stormy" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.take_off(my_plane) }.to raise_error "The weather is stormy - no take off allowed"
    end

  end
end
