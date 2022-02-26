require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :take_off_check_list }
  it { is_expected.to respond_to :land_check_list }


  describe '#land' do
    it 'accepts a plane to land' do
      plane = Plane.new
      allow(subject).to receive(:stormy_weather?).and_return(false)
      expect(subject.land(plane).count).to eq 1
    end

    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Warning: stormy weather! Landing not allowed.'
    end

    it 'prevents landing when airport is full' do
      plane = Plane.new
      allow(subject).to receive(:stormy_weather?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport capacity reached. No more landing allowed.'
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      plane = Plane.new
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'prevents take off when weather is stormy' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect { subject.take_off }.to raise_error 'Warning: stormy weather! Takeoff not allowed.'
    end
  end
end
