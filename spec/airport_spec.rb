require 'airport'
require 'plane'

describe Airport do
  context '#when landing a plane' do
    # it { is_expected.to respond_to(:land).with(1).argument }
    let(:plane_double) { double :plane }

    #   before(:each) do
    #   @plane_double = double :plane
    # end

    it 'should return a success message when we land a plane' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      expect(subject.land(plane_double)).to eq "Plane landed"
    end

    it 'should stop a plane from landing when the weather is Stormy' do
      allow(subject).to receive(:current_weather) { "Stormy" }
      expect { subject.land(plane_double) }.to raise_error "No landing allowed - Stormy weather"
    end

    it 'should stop a plane from landing when the airport is full' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      20.times { subject.land(Plane.new) }
      expect { subject.land(plane_double) }.to raise_error "The airport is full - no landing allowed"
    end

    it 'should prevent a plane that has already landed from landing again' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.land(my_plane) }.to raise_error "That plane is already in the airport"
    end
  end

  describe '#plane_list' do
    it { is_expected.to respond_to :has_plane? }

    it 'should not include a new plane when the airport is empty' do
      expect(subject.has_plane?(Plane.new)).to eq false
    end

    it 'should show that my landed plane is in the airport' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.has_plane?(my_plane)).to eq true
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should return a confirmation that the plane has taken off' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect(subject.take_off(my_plane)).to eq "Successful take off"
    end

    it 'should raise an error if I try to make a plane take off that is not in the airport' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      expect { subject.take_off(Plane.new) }.to raise_error "That plane isn't at the airport"
    end

    it 'should confirm that the plane that has just taken off is no longer at the airport' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      subject.take_off(my_plane)
      expect(subject.has_plane?(my_plane)).to eq false
    end

    it 'should stop a plane from taking off when the weather is Stormy' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      my_plane = Plane.new
      subject.land(my_plane)
      allow(subject).to receive(:current_weather) { "Stormy" }
      expect { subject.take_off(my_plane) }.to raise_error "No take-off allowed - Stormy weather"
    end

    it 'should raise an error if I try to take off from an empty airport' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      expect { subject.take_off(Plane.new) }.to raise_error "There are no planes at the airport"
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }

    it 'should set the capacity when an airport is created' do
      airport = Airport.new(3)
      allow(airport).to receive(:current_weather) { "Sunny" }
      3.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "The airport is full - no landing allowed"
    end

    it 'should set a default capacity when a new airport is created' do
      airport = Airport.new
      allow(airport).to receive(:current_weather) { "Sunny" }
      20.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "The airport is full - no landing allowed"
    end

    it 'should return 15 when there are 5 planes landed' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      5.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 20 - 5
    end

    it 'should return 5 when there are 15 planes landed' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      15.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 20 - 15
    end

    it 'should return 0 when the airport is at max capacity' do
      allow(subject).to receive(:current_weather) { "Sunny" }
      20.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 0
    end
  end
end
