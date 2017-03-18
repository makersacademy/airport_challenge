require 'airport'
require 'plane'

describe Airport do

    it 'Has a method that lands planes' do
      expect(subject).to respond_to :land
    end

    it 'Responds to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    # describe 'Initialization' do
    #   subject { Airport.new }
    #   let(:boeing) { Plane.new }
    #   it ''
    #
    # end

    describe '#land' do
      it 'lands planes in the airport' do
        boeing = Plane.new
        expect(subject.land(boeing)).to eq [boeing]
      end
    end

end
