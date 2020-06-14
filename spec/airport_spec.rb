require 'airport'

describe Airport do
  describe 'initialize' do
    it 'creates a new airport called indiport' do
      indiport = Airport.new
      expect(indiport).to be_an_instance_of(Airport)
    end
  end
end
