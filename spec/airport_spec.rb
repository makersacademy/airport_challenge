require 'airport'

describe Airport do

  context 'So I can get passengers to a destination' do 

    it 'Checks if the airport can land planes' do
      expect(subject).to respond_to(:landing)
    end
  end

  context 'So I can get passengers on the way to their destination' do
    
    it 'Instructs a plane to take off and confirm that it is no longer in the airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
      plane = Plane.new
      subject.landing(plane)
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end
  end

  context 'to ensure saftey' do
    
    it 'I want to prevent landing when the airport is full' do
      subject.capacity.times { subject.landing Plane.new }
      expect { subject.landing Plane.new }.to raise_error 'Airport is full'
    end
  end

  context 'So that the software can be used for many different airports' do
    
    it 'I would like a default airport capacity that can be overridden as appropriate' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  
end