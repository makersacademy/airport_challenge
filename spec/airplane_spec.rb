require 'airplane'
describe Airplane do
  describe '#current_status' do
    before(:each) { @airplane = described_class.new }
    it "Shows that by default the  current_status method will return grounded" do
      expect(@airplane.current_status).to eq :airborne
    end
    it "Shows that the take_off methods changes the current_status instance variable to airborne" do
      @airplane.take_off
      expect(@airplane.current_status).to eq :airborne
    end
    it "Shows that the land method changes the current_status instance variable to grounded" do
      @airplane.land
      expect(@airplane.current_status).to eq :grounded
    end
  end
end
