require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

describe Plane do

  describe '#self.land(airport)' do
    # it 'lands' do
    #   plane = Plane.new
    #   heathrow = Airport.new
    #   expect(plane.land(heathrow)).to eq("The plane has landed.")
    # end

    it 'is stored in the hangar' do
      plane = Plane.new
      heathrow = Airport.new
      expect(heathrow.hangar["1"]).to eq(plane)
    end
    # lands if weather is clear

    # it "doesn't land if weather is stormy" do
    #   plane = Plane.new
    #   heathrow = Airport.new
    #   expect(plane.land(heathrow)).to eq("Cannot land plane.")
    # end

    # does not land when airport is full
  end
  describe '#self.take_off' do
    it 'takes off' do
      plane = Plane.new
      expect(plane.take_off).to eq("Plane has left.")
    end
    # takes off when weather is clear

    # does not take off when weather is stormy

    # prints which airport it leaves??
  end
end
