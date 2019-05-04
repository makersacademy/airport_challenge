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
  end
end
