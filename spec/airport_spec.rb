require 'airport'
require 'plane'
require 'weather_spec'

describe Airport do 

  let(:airport) { Airport.new }
  let(:airport_with_plane) { Airport.new(hanger: [plane]) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
 
  describe '#initialize' do 
  
    it "uses a given capacity and so returns a hanger count over the default capacity of 5" do
      airport10 = Airport.new(Weather.new, 10)
      allow(airport10).to receive(:stormy?).and_return(false)
      6.times { airport10.land(Plane.new) }
      expect(airport10.hanger.count).to eq(6)
    end

    it 'uses a default capacity when no input is given' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

  end

  describe '#land' do
  
    it "should land a plane when weather conditions are good" do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq([plane])
    end 

    it "should not land a plane when weather conditions are stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Stormy weather, abort landing!'
      expect { airport.land(plane) }.to raise_error message
    end

    it "should not land a plane if the hanger is full" do 
      allow(airport).to receive(:stormy?).and_return(false)
      airport.capacity.times { airport.land(Plane.new) }
      message = 'Hanger full, abort landing!'
      expect { airport.land(Plane.new) }.to raise_error message
    end
  end
  
  describe '#take_off' do

    it "should release a plane currently in the hanger" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end

    it "should not release a plane when weather conditions are stormy" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      message = "Stormy weather, cannot take off" 
      expect { airport.take_off(plane) }.to raise_error message
    end 
 
  end 
end
