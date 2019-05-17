require './lib/airport'

describe Airport do
    let(:plane) { Plane.new }

    it {is_expected.to respond_to(:land).with(1).argument}
    
    describe 'landing' do
      it 'stores plane when landed' do
        subject.land(plane)
        expect(subject.plane).to eq plane
      end
    end

  end

describe Plane do


end

