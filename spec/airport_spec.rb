require 'airport'

describe AirPort do
  let(:plane) { double :plane}
  it "lands planes safely at airport" do
    expect(subject).to respond_to :land_safely
  end
  it "takes off safely at airport" do
    expect(subject).to respond_to :take_off_safely
  end
  it { is_expected.to respond_to(:land_safely).with(1).argument }

 describe '#land_safely' do
  it 'raises a error when theres no room to land' do
  AirPort::DEFAULT_CAPACITY.times do
  subject.land_safely Planes.new
  end

  expect {subject.land_safely Planes.new }.to raise_error 'airport is full'

   end
 end
  it 'creates a airport with a capacity that it passed with a argument' do
  airport = AirPort.new(10)
  expect(airport.capacity).to eq(10)
  end

 describe 'bad_weather' do
   it 'stops planes landing and taking off' do
   expect(subject).to  be_stormy
   end

 end

 # it 'flying plane cannot take off and cannot be in an airport' do
 #   expect(subject.take_off_safely
 # end


end
