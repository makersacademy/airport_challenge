require 'plane'

describe Plane do

  describe '#status' do
    it 'confirms that plane has taken off safely' do
      plane = Plane.new
    expect(plane.status).to eq "plane taken off safely"
    end
  end
end
