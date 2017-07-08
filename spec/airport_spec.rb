require 'airport'

describe Airport do
  let(:airport) { described_class.new }

  describe '#new' do
    it 'responds to 1 argument' do
      expect(Airport).to respond_to(:new).with(1).argument
    end

    it 'can have a name when created' do
      name = "London Heathrow"
      airport = Airport.new(name)
      expect(airport.name).to eq name
    end
  end

end
