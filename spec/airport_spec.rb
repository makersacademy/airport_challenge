require_relative '../lib/airport.rb'

describe Airport do
  let(:airport) { Airport.new }

  describe '#capacity' do
    it "should have default capacity" do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it "should have correct capacity when created specified capacity" do
      [4, 6, 7, 8, 343].each do |num|
        expect(Airport.new(num).capacity).to eq(num)
      end
    end
  end
end
