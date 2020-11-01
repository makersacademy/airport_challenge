require 'Airport'

describe Airport do
  it 'responds to the #land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  describe '#land(plane)' do
    it 'lands a plane into the airport' do
      boeing = Plane.new
      expect(subject.land(boeing)).to eq boeing
    end
  end
end
