require './lib/plane.rb'
require './lib/airport.rb'

RSpec.describe Plane do
  describe "weather is good and airport operatons are normal " do
    let(:airport) {Airport.new}
    it "plane is on the ground " do
      allow(airport).to receive(:stormy?).and_return(false)
      plane = Plane.new(airport)
      expect(plane).to respond_to(:take_off_process).with(1).argument
    end
    it 'plane must be in airport and not possible to land if flying' do
      allow(airport).to receive(:stormy?).and_return(false)
      plane = Plane.new(airport)
      expect {plane.landing_process(airport)}.to raise_error("This plane is on the ground")
    end



  end
end
