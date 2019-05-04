require 'planes'

describe Plane do
  describe '#land_at' do
    it 'should respond to the land_at method' do
      expect(subject).to respond_to(:land_at)
    end
  end

  describe '#take_off_from' do
    it 'should respond to the take_off_from method' do
      expect(subject).to respond_to(:take_off_from)
    end
    it 'should not be able to take off in stormy weather' do
      airport = Airport.new
      expect { subject.take_off_from(airport) }.to raise_error 'Too stormy to take off' if allow(airport).to receive(:stormy?) { true }
    end
  end
end
