require_relative '../lib/airport_challenge'
require_relative '../lib/plane.rb'

describe Airport do
    let(:subject) {Airport.new}
    let(:plane) {Plane.new}

    it {is_expected.to respond_to :land}

    it 'should land a plane' do
      expect(subject.land(plane)).to eq plane
    end

end