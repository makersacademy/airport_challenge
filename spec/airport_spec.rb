require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:plane) { Plane.new }

  describe '#land' do
    it 'accepts a plane to land when good weather conditions' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:at_airport).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      allow(subject).to receive(:at_airport).and_return(false)
      expect { subject.land(plane) }.to raise_error 'Warning: stormy weather! Landing not allowed.'
    end

    it 'prevents landing when plane already landed at same airport' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:at_airport).and_return(true)
      expect { subject.land(plane) }.to raise_error 'This plane is already at this airport.' 
    end

    it 'prevents landing when plane already landed at other airport' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:grounded).and_return(true)
      expect { subject.land(plane) }.to raise_error 'This plane is already at an airport.' 
    end

    it 'prevents landing when airport is full' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:at_airport).and_return(false)
      allow(plane).to receive(:grounded).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport capacity reached. No more landing allowed.'
    end
  end

  describe '#take_off' do
    it 'allows plane to take off when good weather conditions' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:left_airport?).and_return(false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'prevents takeoff when weather is stormy' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      allow(subject).to receive(:left_airport?).and_return(false)
      allow(subject).to receive(:at_airport).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Warning: stormy weather! Takeoff not allowed.'
    end

    it 'prevents takeoff if plane already took off' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:left_airport?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'This plane has already taken off.' 
    end

    it 'prevents takeoff if plane not at airport' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      allow(subject).to receive(:left_airport?).and_return(false)
      allow(subject).to receive(:at_airport).and_return(false)
      expect { subject.take_off(plane) }.to raise_error 'This plane is not at this airport.'
    end
  end
end
