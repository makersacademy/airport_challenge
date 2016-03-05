require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'allows the plane to land' do
      airport.land(plane)
    end

    it 'confirms the plane has landed' do
      airport.land(plane)
      # allow(plane).to receive(:land).and_return(true)
      expect(subject.planes).to include plane
    end

    it 'prevents the plane from landing when airport is full' do
      airport.land(plane)
      message = 'No space for landing'
      expect { airport.land(plane) }.to raise_error message
    end
  end

    # describe '#take_off' do
    #   it { is_expected.to respond_to :take_off }
    # end
end