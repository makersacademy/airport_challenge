require 'weather.rb'
describe Weather do
  describe 'stormy' do
    it "should be initialized as false" do
      expect(Weather.new.stormy).to eq false
    end
  end
end
