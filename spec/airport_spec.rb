require 'airport'

describe Airport do

  let(:airport) { Airport.new }  

  describe '#new' do
    it 'returns a new airport object' do
      expect(airport).to be_an_instance_of(Airport)
    end
  end

  describe '#landing' do
    it 'responds to the landing method' do
      expect(airport).to respond_to(:landing)
    end
  end

end
