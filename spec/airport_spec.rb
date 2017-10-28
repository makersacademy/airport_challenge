require 'airport'

describe Airport do
  let(:test_airport) { Airport.new }
  describe 'airport' do
    it 'should create a new airport' do
      expect(test_airport).to be_instance_of(Airport)
    end
  end
end
