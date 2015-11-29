require 'airport'

describe Airport do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands the plane at the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'confirms plane has landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane.landed).to eq true
  end
end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'allows plane to take off from airport' do
      plane = Plane.new
      subject.land(plane)
      plane.landed = true
      subject.take_off(plane)
      expect(subject.plane).to eq plane
    end

    it 'confirms plane has taken off from airport' do
      plane = Plane.new
      subject.land(plane)
      plane.landed = false
      subject.take_off(plane)
      expect(subject.plane.landed).to eq false
    end
  end
