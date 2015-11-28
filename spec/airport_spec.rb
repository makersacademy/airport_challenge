require_relative '../lib/airport.rb'
describe Airport do

  describe 'Default Capacity with Override' do
    it 'checks Airport(class) exists (is Airport == true)' do
      expect(Airport).to be
    end

    it 'Airport has a DEFAULT_CAPACITY(constant)' do
      expect(Airport::DEFAULT_CAPACITY).to be
    end

    it 'Airport has a DEFAULT_CAPACITY == 20 ' do
      expect(Airport::DEFAULT_CAPACITY).to eq(20)
    end

    it 'Airport has a default capacity attribute(instance_variable)' do
      expect(Airport.new).to have_attributes(:default_capacity=> 20)
    end

    it '[KEY BEHAVIOUR] Airport has a default capacity that can be over-ridden' do
      expect(Airport.new(30).instance_variable_get(:@default_capacity)).to eq(30)
    end
  end

end
