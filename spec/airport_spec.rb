require "airport"

describe Airport do
  subject(:heathrow) { described_class.new described_class::DEFAULT_CAPACITY }

  describe "#land" do 
    it 'instructs a plane to land' do
      expect(heathrow).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to take_off' do
      expect(heathrow).to respond_to(:take_off).with(1).argument
    end

    context 'when the airport is full' do 
      it 'does not allow a plane to land by raising an error' do
        plane = Plane.new
        Airport::DEFAULT_CAPACITY.times { heathrow.land(plane) }
        expect { heathrow.land(plane) }.to raise_error('The airport is full.')
      end
    end
  end 
end
