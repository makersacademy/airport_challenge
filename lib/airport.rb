class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "No landing slots available!" if full?
    @planes << plane
    @planes[0]
  end

  def take_off(plane)
    @planes.pop
  end

  private

  def full?
    @planes.count >= capacity
  end

end

# it 'instructs a plane to land and confirm that it landed' do
#     plane = Plane.new
#     expect(subject.land(plane)).to eq plane
#   end
#
#  it 'instructs a plane to take off' do
#     plane = Plane.new
#     subject.land(plane)
#     expect(subject.take_off(plane)).to eq plane
#   end
#
#   it 'confirms that the plane is no longer in the airport' do
#     expect(subject.planes).to be_empty
#   end
#
#   it 'prevents landing when the airport is full' do
#     Airport::DEF_CAPACITY.times {subject.land(Plane.new)}
#     expect{subject.land(Plane.new)}.to raise_error
#   end
