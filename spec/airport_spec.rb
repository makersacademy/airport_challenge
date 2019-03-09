require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'returns a success message when we land a plane' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      expect(subject.land(Plane.new)).to eq "Plane landed"
    end

    it 'should stop a plane from landing when the weather is Stormy' do
      allow(subject).to receive(:check_weather) { "Stormy" }
      expect { subject.land(Plane.new) }.to raise_error "The weather is stormy - no landing allowed"
    end

    it 'should stop a plan from landing when the airport is full' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The airport is full - no landing allowed"
    end

    it 'should prevent a plane that has already landed from landing again' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.land(my_plane) }.to raise_error "That plane is already in the airport"
    end

  end

  describe '#airport_planes' do
    it { is_expected.to respond_to :airport_planes }

    it 'returns no planes when airport is empty' do
      expect(subject.airport_planes).to eq []
    end

    it 'returns a plane when I check what has landed' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.airport_planes).to include my_plane
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'returns a confirmation that the plane has taken off' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.take_off(my_plane)).to eq "Successful take off"
    end

    it 'raises an error if I try to make a non-existent plane take off' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.take_off(Plane.new) }.to raise_error "That plane isn't at the airport"
    end

    it 'should confirm that the plane that has just taken off is no longer at the airport' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      subject.take_off(my_plane)
      expect(subject.airport_planes).not_to eq my_plane
    end

    it 'should stop a plane from taking off when the weather is Stormy' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      allow(subject).to receive(:check_weather) { "Stormy" }
      expect { subject.take_off(my_plane) }.to raise_error "The weather is stormy - no take off allowed"
    end

  end

  describe '#check_weather' do
    it { is_expected.to respond_to(:check_weather) }

    it 'should return either Sunny or Stormy' do
      expect(subject.check_weather).to eq("Sunny").or eq("Stormy")
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }

    it 'should set the capacity when an airport is created' do
      airport = Airport.new(30)
      expect(airport.max_capacity).to eq 30
    end

    it 'should set a default capacity when a new airport is created' do
      airport = Airport.new
      expect(airport.max_capacity).to eq 20
    end

    it 'should return 15 when there are 5 planes landed' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      5.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 20-5
    end

    it 'should return 5 when there are 15 planes landed' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      15.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 20-15
    end

    it 'should return 0 when the airport is at max capacity' do
      allow(subject).to receive(:check_weather) { "Sunny" }
      20.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 0
    end
  end
end
