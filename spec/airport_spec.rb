require 'airport'

describe Airport do

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'raise an error when an airport is full' do
      25.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Plane can\'t land. Airport is full!'
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end