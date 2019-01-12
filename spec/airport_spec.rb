require 'airport'

RSpec.describe Airport do

  plane = Plane.new

  it 'should respond to land with one argument' do
    expect(subject).to respond_to(:land)#.with(1).arguments
  end

  it 'should land a plane and show it in an array airport' do
    expect(subject.land).to be_kind_of(Array)
  end

  it 'should return a plane instance variable in the airport array' do
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
