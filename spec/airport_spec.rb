require 'airport'
require 'plane'

describe Airport do

  let(:plane) { double :plane }

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when weather is stormy' do
        allow(subject).to receive(:good_weather?).and_return(false)
        #chance.expects(:rand).returns(0.5)
        allow(plane).to receive(:on_ground).and_return(false)
        expect{subject.land(plane)}.to raise_error "Can't land when stormy"
    end

    it 'raises an error when plane on ground' do
      allow(plane).to receive(:on_ground).and_return(true)
      expect { subject.land(plane) }.to raise_error "Plane not in flight"
    end

    it 'raises an error when airport is full' do
      allow(subject).to receive(:good_weather?).and_return(true)
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
      allow(subject).to receive(:good_weather?).and_return(false)
      allow(plane).to receive(:on_ground).and_return(true)
      subject.add_new_plane(plane)
      expect { subject.takeoff(plane) }.to raise_error "Can't takeoff when stormy"
    end

    it 'raises an error when plane already in flight' do
      allow(plane).to receive(:on_ground).and_return(false)
      expect { subject.takeoff(plane) }.to raise_error "Plane already in air"
    end

  end

  describe '#find_plane'

    it { is_expected.to respond_to(:find_plane).with(1).argument }

    it 'finds a plane in an airport' do
      allow(plane).to receive(:on_ground).and_return(true)
      subject.add_new_plane(plane)
      expect(subject.find_plane(plane)).to eq plane
    end

    it 'raises an error when plane not in airport' do
      expect { subject.find_plane(plane) }.to raise_error "Plane not in airport"
    end

  describe '#initilize' do
    it 'should have a variable capacity' do
        airport = Airport.new(50)
        allow(airport).to receive(:good_weather?).and_return(true)
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
