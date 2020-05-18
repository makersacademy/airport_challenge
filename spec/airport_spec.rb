require 'airport'

describe Airport do

  it 'accepts capacity argument when new airport is created' do
    expect(Airport).to respond_to(:new).with(1).argument
  end
      
  it 'responds to #land with 1 argument' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'has a airport_hanger attribute' do
    expect(subject).to respond_to(:airport_hanger)
  end

  it 'responds to #take_off with 1 argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
  
  it 'responds to #stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  describe '#airport_hanger' do
    it 'returns landed planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.airport_hanger[-1]).to eq(plane)
    end
  end

  describe '#land' do
    it 'returns plane after landing' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end

    it 'raises error if airport_hanger is full' do
      plane = Plane.new
      plane1 = Plane.new
      subject.land(plane)
      expect { subject.land(plane1) }.to raise_error(StopIteration)
    end
  end

  describe '#take_off' do
    it 'returns plane after take_off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
