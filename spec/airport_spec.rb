require 'weather'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  
  BAD_WEATHER_MSG = 'sorry cannot land or take off due to bad weather conditions'
  NO_CAPACITY_MSG = 'sorry, cannot land as airport has no space'

  it 'checks the weather' do
    expect(subject.sunny?).to(respond_to { Weather.new })
  end
  
  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  it 'confirms if the capacity is full' do
    subject.ramp << plane
    expect(subject.full?).to eq true
  end

  describe '#landing' do
    it 'refuses landing if weather is bad' do
      allow(subject).to receive(:sunny?).and_return(false)
      expect { subject.land(plane) } .to raise_error(RuntimeError, BAD_WEATHER_MSG) 
    end

    it 'refuses landing if the capacity is full' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) } .to raise_error(RuntimeError, NO_CAPACITY_MSG)
    end

    it 'cannot land again if the plane is already on the ground' do
      allow(subject).to receive(:parked?).and_return(true)
      expect { subject.land(plane) }.to raise_error(RuntimeError, 'the plane has already parked in the airport')
    end

    it 'allows landing if good weather and has capacity, and has not parked before' do
      allow(subject).to receive(:ready_for_landing).and_return(true)
      subject.land(plane)
      expect(subject.ramp.include? plane).to be true
    end
  end

  describe '#ready_for_landing' do
    it 'returns true if the conditions are met' do
      allow(subject).to receive(:parked?).and_return(false)
      allow(subject).to receive(:sunny?).and_return(true)
      allow(subject).to receive(:full?).and_return(false)
      expect(subject.ready_for_landing(plane)).to be true
    end
  end

  describe '#takeoff' do
    it 'refuses takeoff if the weather is bad' do
      allow(subject).to receive(:sunny?).and_return(false)
      allow(subject).to receive(:parked?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error(RuntimeError, BAD_WEATHER_MSG) 
    end

    it 'plane raises error if it tries take off from airport it is not in' do
      allow(subject).to receive(:parked?).and_return(false)
      expect { subject.takeoff(plane) } .to raise_error(RuntimeError, 'the plane is not in the airport')
    end

    it 'removes the plane from the ramp after it takes off' do
      allow(subject).to receive(:ready_for_takeoff).and_return(true)
      subject.takeoff(plane)
      expect(subject.ramp.include? plane).to eq false
    end

    it 'allows take-off if all conditions are met' do
      allow(subject).to receive(:sunny?).and_return(true)
      allow(subject).to receive(:parked?).and_return(true)
      expect(subject.ramp.include? plane).to be false
    end
  end

  describe '#ready_for_takeoff' do
    it 'returns true if the conditions are met' do
      allow(subject).to receive(:parked?).and_return(true)
      allow(subject).to receive(:sunny?).and_return(true)
      expect(subject.ready_for_takeoff(plane)).to be true
    end
  end
end
