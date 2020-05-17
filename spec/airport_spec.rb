require 'airport'

describe Airport do
  subject { Airport.new }

  let(:plane) { Plane.new }
  DEFAULT_CAPACITY = 10

  before do
    allow(subject).to receive(:rand) { 4 }
    plane.land(subject)
  end

  it 'airport responds to landing method and takes an argument' do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it 'adds the plane to the airport class' do
    expect(subject.instance_variable_get(:@planes)).to include(plane)
  end

  it "won't allow landing when aiport is full" do
    (DEFAULT_CAPACITY - 1).times { subject.landing(Plane.new) }
    expect { subject.landing(Plane.new) }.to raise_error('Airport at capacity')
  end

  it 'will take a capacity of 20' do
    bristol = Airport.new(20)
    allow(bristol).to receive(:rand) { 4 }
    20.times { bristol.landing(Plane.new) }
    expect { bristol.landing(Plane.new) }.to raise_error('Airport at capacity')
  end

  it 'removes plane from airport when departs' do
    subject.depart(plane)
    expect(subject.instance_variable_get(:@planes)).not_to include(plane)
  end

  it 'removes plane from airport when departs and tells user it has left' do
    expect { subject.depart(plane) }.to output("#{plane} has left the airport\n").to_stdout
  end

  it 'when random_number is 4 weather returns sunny' do
    expect(subject.weather).to eq('sunny')
  end

end
