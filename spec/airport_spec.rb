require 'airport'

describe Airport do

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end