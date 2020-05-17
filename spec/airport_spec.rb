require 'airport'

describe Airport do
  it 'responds to #land with 1 argument' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe '#land' do
    it 'returns plane after landing' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end

  it 'responds to #take_off with 1 argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  describe '#take_off' do
    it 'returns plane after take_off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
