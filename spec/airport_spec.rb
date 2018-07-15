require 'airport'

describe Airport do

  # call new instance of Plane
  let(:plane) { Plane.new }
  # responds to basic methods
  it 'responds to planes' do
    expect(subject).to respond_to :planes
  end

  # landing planes
  it 'allows planes to land' do
    # plane = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
    expect(subject.land(plane))
  end

  # plane leaves airport
  it 'allows planes to take off' do
    subject.land(plane)
    expect(subject).to respond_to(:takeoff).with(1).argument
    expect(subject.takeoff(plane))
  end

  # confirm takeoff
  it 'confirms that plane has left the airport' do
    expect(subject.takeoff(plane)).to eq("Successful takeoff!")
  end

  # stormy weather: prevent plane from taking off
  it 'refuses takeoff due to storm' do
    if subject.weather != "fair"
      expect(subject.takeoff).to raise_error("Takeoff not allowed due to bad weather")
    end
  end

  # stormy weather: prevent plane from landing
  it 'refuses landing due to storm' do
    if subject.weather != "fair" 
      expect(subject.land(plane)).to raise_error("Landing not allowed due to bad weather")
    end
  end

  # airport full; prevent landing
  it 'prevents landing when airport is full' do
    subject.airport_full? do
      expect(subject.land(plane)).to raise_error("Plane cannot land; airport is full")
    end
  end
end
