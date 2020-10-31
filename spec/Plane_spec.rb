require 'Plane'
describe Plane do
  it 'responds to #land' do
    expect(subject).to respond_to :land
  end
  it 'responds to #take_off' do
    expect(subject).to respond_to :take_off
  end
  describe '#take_off' do
    it "confirms that the plane is no longer in the airport" do
      plane = Plane.new
      expect(plane.take_off).to eq "Plane no longer in airport!"
    end
  end
end
