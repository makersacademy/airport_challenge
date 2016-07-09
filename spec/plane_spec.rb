require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off}
  it { is_expected.to respond_to :landed}

  describe '#land' do

    it 'raises an error when plane is not in flight' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(weather)
      expect { plane.land }.to raise_error 'Plane is not in flight'
    end

    it 'raises an error when weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { true }
      expect { plane.land (weather) }.to raise_error 'Too stormy to land'
    end

    it 'changes plane to landed' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane.land (weather)
      expect(plane.landed).to eq true
    end

  end

  describe '#take_off' do

    it 'raises an error when plane is already in flight' do
      expect { subject.take_off }.to raise_error 'Plane is already in flight'
    end

    it 'raises an error when weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane.land (weather)
      allow(weather).to receive(:stormy?) { true }
      expect { plane.take_off (weather) }.to raise_error 'Too stormy to take off'
    end

    it 'changes plane to not landed' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane.land (weather)
      plane.take_off (weather)
      expect(plane.landed).to eq false
    end

  end

end
