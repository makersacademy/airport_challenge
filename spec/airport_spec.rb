require 'airport'
describe Airport do
  subject(:airport) {described_class.new}
  
  describe '#initialize' do
    it 'should set a default capacity if one is not provided' do
      expect(airport.CAPACITY).to eq(20)
    end

    it 'should change the capacity if one is provided' do
      airport = described_class.new(30)
      expect(airport.CAPACITY).to eq(30)
    end
  end

end