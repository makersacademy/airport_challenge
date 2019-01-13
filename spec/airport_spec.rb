require 'airport'
require 'weather'

RSpec.describe Airport do
  describe 'can land and take off planes' do

    it 'allow a plane to land' do
      airport = Airport.new
      plane1 = Plane.new
      expect(airport.land(plane1)).to eq [plane1]
    end

    it 'allow a plane to take-off' do
      airport = Airport.new
      plane1 = Plane.new
      expect(airport.takeoff(plane1)).to eq []
    end

  end

  describe 'can check status' do

    it 'and refuse plane if already landed' do
      airport = Airport.new
      plane1 = Plane.new
      airport.land(plane1)
      expect { airport.land(plane1) }.to raise_error 'Already landed'
    end

    it 'and prevent landing when the airport is full' do
      airport = Airport.new
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Reached Maximum Capacity'
    end

  end

  describe 'can check the weather' do

    it 'and refuse landing if stormy' do
      airport = Airport.new
      # expect { airport.stormy? == true }.to raise_error 'Unable to land due to storm'
      # <<---- Not sure how to write this test.
    end
  end
end
