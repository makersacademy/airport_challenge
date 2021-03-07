require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }

  it 'can land plane' do
    expect(subject).to respond_to(:land)
  end

  it 'can take off plane' do
    expect(subject).to respond_to(:takeoff)
  end
  
  context 'weather is good' do 
    before do
      allow(subject).to receive(:stormy?) { false }
    end
    it 'raises an error when full' do 
      subject.land(Plane.new)
      expect { Airport::DEFAULT_CAPACITY.times do
        subject.land(Plane.new) 
      end 
      }.to raise_error 'Airport is full: plane cannot land'
    end 

    it 'raises an error when empty' do
      expect { subject.takeoff(Plane.new) }.to raise_error 'Airport is empty: no planes to takeoff'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  

  context 'weather is stormy' do
    before do 
      allow(subject).to receive(:stormy?) { true }
    end
    it 'cannot land plane' do 
      expect { subject.land(Plane.new) }.to raise_error 'Plane cannot land due to weather conditions'
    end 

    it 'plane cannot takeoff' do 
      expect { subject.takeoff(Plane.new) }.to raise_error 'Plane cannot takeoff due to weather conditions'
    end 
  end 
end 
