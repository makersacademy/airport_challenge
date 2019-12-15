require 'plane'
require 'airport'
require 'weather'

describe Airport do

  describe "land a plane" do
    plane = Plane.new
    stormy = false
    it {expect(subject.land(plane, stormy)).to eq([plane])}
  end

  describe "Default capacity is 20: can't land a plane because the airport is full" do
    plane = Plane.new
    stormy = false
    it do
      20.times{subject.land(plane, stormy)}
      expect{subject.land(plane, stormy)}.to raise_error "No Space"
    end
  end

  describe "Override the default capacity of the airport and show it stops landing planes at that number " do
    plane = Plane.new
    stormy = false
    airport = Airport.new(10)
    10.times{airport.land(plane, stormy)}
    it do
      expect{airport.land(plane, stormy)}.to raise_error "No Space"
    end
  end

 describe "I want to instruct a plane to take off" do
   plane = Plane.new
   stormy = false
   it do
     subject.land(plane, stormy)
     subject.take_off(plane, stormy)
     expect(subject.planes).to be_empty
   end
  end
  describe "Weather" do
    describe "Don't let a plane land if stormy" do
      plane = Plane.new
      weather = Weather.new
      stormy = weather.set_stormy
      it do
        expect{subject.land(plane, stormy)}.to raise_error "Cannot land when stormy"
      end
    end
    describe "Don't let a plane take take_off if stormy" do
      plane = Plane.new
      weather = Weather.new
      stormy = weather.set_stormy
      it do
        expect{subject.land(plane, stormy)}.to raise_error "Cannot land when stormy"
      end
    end

  end
end
