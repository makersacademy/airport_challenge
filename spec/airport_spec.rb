require 'Airport'
require 'Conditions'

describe Airport do

  describe '#land' do
    it 'instructs a plane to land' do
      plane = Plane.new
      conditions = Conditions.new
      subject = Airport.new(conditions)
      allow(conditions).to receive(:stormy).and_return false
      expect(subject.land(plane)).to eq(plane)
    end
    it 'fails if weather is stormy' do
      conditions = Conditions.new
      plane = Plane.new
      subject = Airport.new(conditions)
      expect{subject.land(plane)}.to raise_error "Cannot land due to stormy weather"
    end
  end

  describe'#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      conditions = Conditions.new
      subject = Airport.new(conditions)
      allow(conditions).to receive(:stormy).and_return false
      expect(subject.take_off(plane)).to eq(plane)
    end
    it 'fails if weather is stormy' do
      conditions = Conditions.new
      plane = Plane.new
      subject = Airport.new(conditions)
      expect{subject.take_off(plane)}.to raise_error "Cannot take off due to stormy weather"
    end
  end
end
