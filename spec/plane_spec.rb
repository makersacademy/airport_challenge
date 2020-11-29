require 'plane'

describe Plane do
  it 'can create an instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  describe Plane do
    it { is_expected.to respond_to(:working?)}
  end

  # it 'can respond to land' do
  #   plane = Plane.new
  #   expect(plane).to respond_to(:land)
  # end
  #
  # it 'should instruct a plane to land at an airport' do
  #   plane = Plane.new
  #   expect(subject.land).to eq ('plane landed')
  # end
  #
  # it 'can respond to take off' do
  #   plane = Plane.new
  #   expect(plane).to respond_to(:takeoff)
  # end
  #
  # it 'should instruct a plane to land at an airport' do
  #   plane = Plane.new
  #   expect(subject.takeoff).to eq ('plane left airport')
  # end

#########################################
end
