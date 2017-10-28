require 'plane'

describe Plane do

  describe '#initialize' do
    it 'returns land message if initialized as landing plane' do
      plane = Plane.new
      expect(plane.flight_status).to eq('plane landed safely')
    end

    it 'returns take off message if initialized as take off plane' do
      plane = Plane.new
      expect(plane.flight_status).to eq('plane taken off safely')
    end
  end
end
