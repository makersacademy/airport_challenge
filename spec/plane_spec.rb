require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport, park: nil)}

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'is expected to respond to #landed? with true if landed' do
      plane.landed = false
      plane.land(airport)
      expect(plane.landed?).to eq true
    end

    it 'is expected to respond to #landed? with false if not landed' do
      plane.landed = false
      expect(plane.landed?).to eq false
    end

    it 'is expected to raise an error if weather is stormy' do
      plane.landed = false
      plane.stormy = true
      expect {plane.land(:airport)}.to raise_error("It is too stormy to land")
    end

    it 'is expected to raise an error if asked to land when already landed' do
    allow(plane).to receive(:landed?) { true }
    expect {plane.land(airport)}.to raise_error("But...we *are* landed!")
    end

  describe '#take_off' do

  it 'is expected to respond to #landed? with false when it takes off' do
    plane.landed = true
    plane.take_off
    expect(plane.landed?).to eq false
  end

  it 'is expected to raise an error if weather is stormy' do
    plane.stormy = true
    plane.landed = true
    expect {plane.take_off}.to raise_error("It is too stormy to take off")
  end

  it 'is expected to raise an error if already airborne' do
    plane.landed = false
    expect {plane.take_off}.to raise_error("Can't take off - plane is already airborne!")
  end

end
end
end
