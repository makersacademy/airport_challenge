require 'airport'

describe Airport do
  context '#land' do
    it 'can be called on an Airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
end