require 'airport'

describe Airport do

  describe '#initialize' do
  it 'returns DEFAULT_CAPACITY for airport if none is provided' do
    expect{(Airport.new::capacity).to eq airport::DEFAULT_CAPACITY}
  end
  it 'sets capacity when specified on initializaion' do
    expect{(Airport.new(10)::capacity).to eq 10}
  end
end

  describe '#land' do
    it 'instructs plane to land' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'Does not allow landing when airport full' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return true
      plane = Plane.new

        expect{ subject.land(plane) }.to raise_error 'Cannot land plane: Airport full'
         end
    it 'instructs plane not to land when weather is stormy' do
      airport = Airport.new
      plane =Plane.new
         allow(subject).to receive(:stormy?).and_return true
         expect { subject.land(plane) }.to raise_error 'Cannot land: weather is stormy'
       end
     end


  describe '#take_off' do
  it 'instructs plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument

  end
end

  it 'instructs plane not to take off when weather is stormy' do
    plane =Plane.new
    allow(subject).to receive(:stormy?).and_return true
  expect { subject.take_off(:plane) }.to raise_error 'Cannot take off: weather is stormy'
  end
end
