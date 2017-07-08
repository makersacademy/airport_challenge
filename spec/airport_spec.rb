require 'airport'

describe Airport do
  let(:airport) { described_class.new("London Heathrow") }
  
  describe '#new' do

    it 'must have a name' do
      expect { Airport.new }.to raise_error ArgumentError
    end

    it 'can be named when created' do
      airport = Airport.new("London Gatwick")
      expect(airport.name).to eq "London Gatwick"
    end
  end

end
