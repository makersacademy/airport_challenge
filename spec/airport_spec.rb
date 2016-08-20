require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }
  let(:weather) { double :weather, stormy: false }
  let(:bad_weather) { double :bad_weather, stormy: true }

  describe '#land' do

    it 'should instruct a plane to land and receive confirmation that it has landed' do
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do

    it 'should instruct a plane to take and receive confirmation that it is no longer in the airport' do
      airport.land(plane) #refactor later!
      airport.land(plane2) #refactor later!
      expect(airport.takeoff(plane, weather)).to eq [plane2]
    end

    it 'should raise an error if weather is stormy' do
      airport.land(plane)
      airport.land(plane2)
      expect{airport.takeoff(plane, bad_weather)}.to raise_error "Stormy weather! It's too dangerous to fly right now."
    end
  end

end
