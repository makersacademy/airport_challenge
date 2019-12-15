require 'airport'

describe Airport do

  let(:plane) { Plane.new }
  # plane = double('plane')
  # allow(plane).to receive :flying
 
  describe '#initialization' do
    it { expect(subject).to be_an_instance_of Airport }

    it 'allows variable capacity to be set through initialization' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end
  end

  describe '#land' do
   
    it 'allows a plane to land in the dock' do
      subject.sunny = true
      subject.land(plane)
      expect(subject.dock).to include plane
    end

    it 'raises an error when the dock is full & tests for default capacity being 10' do
      subject.sunny = true
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error 'Airport dock is full'
    end

    it 'allows variable capacity to be set though attr_accessor' do 
      subject.capacity = 20
      expect(subject.capacity).to eq 20
    end
       
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      plane.flying = false
      subject.sunny = true
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.dock).to eq []
    end

    it 'raises error when weather is stormy' do
      subject.sunny = false
      expect{subject.land(plane)}.to raise_error 'Weather is stormy, abort!!!'
    end
  end

  describe '#confirm_take_off' do
    it 'responds if a plane has taken off or not' do 
      subject.sunny = true
      subject.land(plane)
      expect(subject.confirm_take_off(plane)).to match /still in dock/
      subject.take_off(plane)
      expect(subject.confirm_take_off(plane)).to match /Successful takeoff/
    end
  end
end
