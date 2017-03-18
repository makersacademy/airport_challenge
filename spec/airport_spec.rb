require 'airport'

describe Airport do
  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
end
