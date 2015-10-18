require 'airport'


describe AirPort do
  it 'lands planes safely at airport' do
  expect(subject).to respond_to :land_safely
  end

  it 'takes off safely at airport' do
  expect(subject).to respond_to :take_off_safely
  end

  it { is_expected.to respond_to(:land_safely).with(1).argument }

  describe '#land_safely' do
   it 'raises a error when theres no room to land' do
   AirPort::DEFAULT_CAPACITY.times do
   subject.land_safely Planes.new
  end

  expect { subject.land_safely Planes.new }.to raise_error 'airport is full'
    end
  end

  it 'creates a airport with a capacity that it passed with a argument' do
    airport = AirPort.new(10)
    expect(airport.capacity).to eq(10)
  end

  it 'it creates a airport with DEFAULT_CAPACITY if no capacity is passed' do
    expect(subject.capacity).to eq(AirPort::DEFAULT_CAPACITY)
  end

  describe 'bad_weather' do
    it 'stops planes landing and taking off' do
    allow(subject).to receive(:stormy?).and_return true
    expect(subject).to be_stormy
    end
  end

  describe 'flying' do
    it 'flying plane cannot take off' do
    allow(subject).to receive(:flying?).and_return true
    expect(subject).to be_flying
    end
  end

  describe 'non_flying' do
    it 'non flying plane cannot land' do
    subject.non_flying?
    expect(subject).to be_non_flying
    end
  end
end
  
