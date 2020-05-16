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
    it "the operator can change the capacity" do
      [4, 6, 7, 8, 343].each do |num|
        airport = Airport.new(num)
        expect(airport.capacity + 50).to eq(num + 50)
      end
    end
  end
end
