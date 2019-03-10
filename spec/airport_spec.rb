require 'airport'

RSpec.describe 'Airport' do
  context 'It be an instance of Airport class' do
    it 'Should be an Airport object' do
      Heathrow = Airport.new
      expect(Heathrow.class).to eq Airport
    end
  end

  context 'It should have a capacity method' do
    it "Should have a capacity method" do
      Heathrow = Airport.new
      expect(Heathrow.capacity(5)).to eq 5
    end
  end
end
