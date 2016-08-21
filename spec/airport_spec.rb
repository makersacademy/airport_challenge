require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let (:plane) { double :plane}
  let (:weather) { double :weather}

  it 'should have default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'should have a custom capacity' do
    airport = Airport.new(25)
    expect(airport.capacity).to eq 25
  end

  context "weather is suitable for landing in these tests" do
    before do
      allow(subject).to receive(:weather_check).and_return(nil)
      allow(plane).to receive(:landed)
      allow(plane).to receive(:left)
    end

    it 'should accept landing planes' do
      subject.land(plane)
      expect(subject.landed_planes.last).to eq(plane)
    end

    it 'should not accept a landed plane' do
      subject.land(plane)
      msg = "This plane has already landed"
      expect{subject.land(plane)}.to raise_error (msg)
    end

    it 'should let planes to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).to eq([])
    end

    it 'should not let planes to land if airport is full' do
      subject = Airport.new(0)
      msg = "You can not land since airport is full"
      expect{subject.land(Plane.new)}.to raise_error(msg)
    end
  end

  context "weather should be stormy for these tests" do

    before do
      allow(subject).to receive(:weather_check).and_return("stormy")
    end

    it 'should not let planes land when the weather is stormy' do
      expect { subject.land(Plane.new) }.to raise_error(RuntimeError)
    end
  end
end
