require './lib/airport'
describe Airport do

  describe '#land' do
    it 'can land a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

  end
end
