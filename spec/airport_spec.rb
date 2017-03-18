require 'airport'
describe Airport do
  let (:plane) {double :plane}
  it 'has a method that lands planes' do
    expect(subject).to respond_to :land
  end

  it 'responds to land with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe '#land' do
    it 'lands planes in the Airport' do
      plane = double(:plane)
      allow(plane).to receive(:land_plane)
      expect(subject.land(plane)).to include plane
    end

  end

end
