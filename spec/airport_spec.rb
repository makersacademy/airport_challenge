require 'airport'

describe Airport do
  it {should respond_to(:land).with(1).argument}
  it {should respond_to(:take_off)}
  it {should respond_to(:capacity)}
  it {should respond_to(:planes)}
  it {should respond_to(:closed?)}

  describe "#capacity" do
    it 'has default specified in class' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    let (:plane){double(:plane)}
    it 'shows plane that has just landed in @planes' do
      subject.land(plane)
      expect(subject.planes.last).to eq(plane)
    end
  end

  describe '#take_off' do
    let (:plane){double(:plane)}
    it 'produces a Plane object' do
      subject.land(plane)
      landed_plane = subject.planes.last
      flying_plane = subject.take_off
      expect(flying_plane).to eq(landed_plane)

    end
  end

end
