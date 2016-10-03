require 'airport'
require 'plane'

describe Airport do

  describe '#land' do

    #let(:plane) { double :plane }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when weather is stormy' do
        #allow(subject).to receive(:check_weather).and_return(true)
        plane = Plane.new
        plane.on_ground = false
        expect{subject.land(plane)}.to raise_error "Can't land when stormy"
    end

    it 'raises an error when plane on ground' do
      plane = Plane.new
      subject.add_new_plane(plane)
      expect { subject.land(plane) }.to raise_error "Plane not in flight"
    end

    it 'raises an error when airport is full' do
      allow(subject).to receive(:check_weather).and_return(false)
      Airport::DEFAULT_CAPACITY.times do
        plane = Plane.new
        plane.on_ground = false
        subject.land(plane)
      end
        plane = Plane.new
        plane.on_ground = false
        expect{subject.land(plane) }.to raise_error "Airport full"
    end

  end

  describe '#takeoff' do

    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'raises an error when weather is stormy' do
      #allow(subject).to receive(:check_weather).and_return('stormy')
      plane = Plane.new
      subject.add_new_plane(plane)
      expect { subject.takeoff(plane) }.to raise_error "Can't takeoff when stormy"
    end

    it 'raises an error when plane already in flight' do
      plane = Plane.new
      plane.on_ground = false
      expect { subject.takeoff(plane) }.to raise_error "Plane already in air"
    end

  end

  describe '#find_plane'

    it { is_expected.to respond_to(:find_plane).with(1).argument }

    it 'finds a plane in an airport' do
      plane = Plane.new
      subject.add_new_plane(plane)
      expect(subject.find_plane(plane)).to eq plane
    end

    it 'raises an error when plane not in airport' do
      expect { subject.find_plane(Plane.new) }.to raise_error "Plane not in airport"
    end

  describe '#initilize' do
    it 'should have a variable capacity' do
        airport = Airport.new(50)
        allow(airport).to receive(:check_weather).and_return(false)
          50.times do
          plane = Plane.new
          plane.on_ground = false
          airport.land(plane)
          end
        plane = Plane.new
        plane.on_ground = false
        expect{airport.land(plane) }.to raise_error "Airport full"
    end
  end
end
