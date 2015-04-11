require 'airport'

describe Airport do

  context 'taking off and landing' do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }

    it 'can land a plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    xit 'a plane can take off'
  end

  context 'traffic control' do

    xit 'a plane cannot land if the airport is full'

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
