require_relative '../lib/airport.rb'

describe Airport do

  describe '#initialize' do
    it "should be able to take one or no parameters" do
      expect(Airport).to respond_to(:new).with(1).argument
      expect(Airport).to respond_to(:new).with(0).arguments
    end
  end
end
