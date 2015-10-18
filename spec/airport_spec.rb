require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'raise an error when an airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Plane can\'t land. Airport is full!'
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end