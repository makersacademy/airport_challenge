require_relative '../lib/airport.rb'

describe Airport do

  describe '#initialize' do
    it "should be able to take one or no parameters" do
      expect(Airport).to respond_to(:new).with(1).argument
      expect(Airport).to respond_to(:new).with(0).arguments
    end
  end

  let(:airport) { Airport.new }

  describe '#capacity' do
    it "should have default capacity" do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it "should have capacity set when created" do
      [4, 6, 7, 8, 343].each do |num|
        expect(Airport.new(num).capacity).to eq(num)
      end
    end
  end
end
