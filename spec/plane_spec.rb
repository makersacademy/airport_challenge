require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

describe Plane do

  describe '#self.land(airport)' do
    it 'lands if weather is clear' do
      plane = Plane.new
      heathrow = Airport.new
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      expect(plane.land(heathrow)).to eq("The plane has landed.")
    end

    it "doesn't land if stormy" do
      plane = Plane.new
      heathrow = Airport.new
      allow(Kernel).to receive(:rand).with(0..1).and_return(1)
      expect(plane.land(heathrow)).to eq("Cannot land, adverse weather.")
    end

    it 'is stored in the hangar' do
      plane = Plane.new
      heathrow = Airport.new
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      plane.land(heathrow)
      expect(heathrow.hangar[0]).to eq(plane)
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
    it 'takes off when weather is clear' do
      plane = Plane.new
      heathrow = Airport.new
      heathrow.hangar << plane
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      plane.take_off(heathrow)
      expect(plane.take_off(heathrow)).to eq("Plane has left.")
    end

    it 'gets removed from the hangar when taking off' do
      plane = Plane.new
      heathrow = Airport.new
      heathrow.hangar << plane
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      plane.take_off(heathrow)
      expect(heathrow.hangar).to eq([])
    end

    it "doesn't take off if stormy" do
      plane = Plane.new
      heathrow = Airport.new
      heathrow.hangar << plane
      allow(Kernel).to receive(:rand).with(0..1).and_return(1)
      plane.take_off(heathrow)
      expect(heathrow.hangar).to eq([plane])
    end
    # prints which airport it leaves??
  end
end
