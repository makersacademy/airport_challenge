require 'airport'

RSpec.describe Airport do

  plane = Plane.new

  it 'should respond to land with one argument' do
    expect(subject).to respond_to(:land)#.with(1).arguments
  end

  it 'should return an array with the Plane' do
    allow(subject.airport_weather).to receive(:rand).and_return(21)
    expect(subject.land).to be_kind_of(Array)
  end

  it 'should return to not be an empty Array' do
    allow(subject.airport_weather).to receive(:rand).and_return(1)
    expect(subject.land).not_to be_empty
  end

  it 'should raise an error if plane wants to land in a storm' do
    allow(subject.airport_weather).to receive(:rand).and_return(92)
    expect { subject.land }.to raise_error('You cannot land in a stormy weather!')
  end

  it 'should return a plane instance variable in the airport array' do
    allow(subject.airport_weather).to receive(:rand).and_return(11)
    expect(subject.land.last).to be_kind_of(Plane)
  end

  it 'should respond to take_off' do
    expect(subject).to respond_to(:take_off)#.with(1).arguments
  end

  it 'should return a confirmation that the plane took off' do
    allow(subject.airport_weather).to receive(:rand).and_return(30)
    expect(subject.take_off).to eq('Plane took off!')

  end

  it 'should raise an error if plane wants to take off in a storm' do
    allow(subject.airport_weather).to receive(:rand).and_return(86)
    expect { subject.take_off }.to raise_error('You cannot take off in a stormy weather!')
  end

end
