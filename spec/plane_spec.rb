require 'plane.rb'

describe Plane do

  subject(:plane) {described_class.new}
  let (:airport) {Airport.new}

  it { is_expected.to respond_to(:status) }

  describe '#status' do
    it 'returns "in the air" when the plane is in the air' do
      expect(plane.status).to eq "In the air!"
    end
  end

end
