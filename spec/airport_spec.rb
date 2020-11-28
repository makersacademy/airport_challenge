require 'weather'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  it 'confirms if the capacity is full' do
    subject.ramp << plane
    expect(subject.capacity?).to be false
  end

  describe '#landing' do
    it 'refuses landing if weather is bad' do
      allow(subject).to receive(:good_weather?).and_return(false)
      message = 'sorry, plane cannot land'
      expect { subject.land(plane) } .to raise_error message
    end

    it 'refuses landing if the capacity is full' do
      allow(subject).to receive(:capacity?).and_return(false)
      message = 'sorry, plane cannot land'
      expect { subject.land(plane) } .to raise_error message
    end

    it 'allows landing if good weather and has capacity' do
      allow(subject).to receive(:capacity?).and_return(true)
      allow(subject).to receive(:good_weather?).and_return(true)
      subject.land(plane)
      expect(subject.ramp.include? plane).to eq true
    end
  end

  describe '#takeoff' do
    it 'refuses takeoff if the weather is bad' do
      allow(subject).to receive(:good_weather?).and_return(false)
      message = 'sorry, plane cannot take off due to bad weather'
      expect { subject.takeoff(plane) }.to raise_error message 
    end

    it 'allows take-off if the weather is good' do
      expect(plane).to respond_to(:takeoff)
    end

    it 'removes the plane from the ramp after it takes off' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.ramp.include? plane).to eq false
    end
  end
end
