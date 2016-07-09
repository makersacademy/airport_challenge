require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off}

  describe '#land' do

    it 'raises an error when plane is not in flight' do
      plane = Plane.new
      plane.land
      expect { plane.land }.to raise_error 'Plane is not in flight'
    end

    it 'raises an error when weather is stormy' do
      plane = Plane.new
      weather  = double(:weather, :stormy => true)
      plane.land weather
      expect { plane.land }.to raise_error 'Too stormy to land'
    end

    it 'changes plane to landed' do
      plane = Plane.new
      plane.land
      expect(plane.landed).to eq true
    end

  end

  describe '#take_off' do

    it 'raises an error when plane is already in flight' do
      expect { subject.take_off }.to raise_error 'Plane is already in flight'
    end

    it 'changes plane to not landed' do
      plane = Plane.new
      plane.land
      expect(plane.take_off).to eq false
    end

  end

end
