require 'airport'

describe Airport do

  it 'cannot overfill airport' do
    expect(subject.full?).to eq false
    subject.capacity.times do
      plane = double('plane', :land => true)
      weather = double('weather', :status => 'sunny')
      plane.land(weather, subject)
      subject.receive(plane)
    end
    expect(subject.full?).to eq true
  end

  it 'has a planes array' do
    expect(subject).to respond_to :planes
  end

  it 'responds to capacity' do
    expect(subject).to respond_to :capacity
  end

  it 'responds to receive' do
    expect(subject).to respond_to :receive
  end

  it 'responds to release' do
    expect(subject).to respond_to :release
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq 20
  end

  it 'can have capacity overridden' do
    subject = Airport.new(30)
    expect(subject.capacity).to eq 30
  end

  it 'receives landing planes into its planes array' do
    plane = double('plane', :land => true)
    weather = double('weather', :status => 'sunny')
    plane.land(weather, subject)
    subject.receive(plane)
    expect(subject.planes.count).to eq 1
  end

  it 'releases departing planes from its planes array' do
    plane = double('plane', :take_off => true, :land => true)
    weather = double('weather', :status => 'sunny')
    subject.receive(plane)
    expect(subject.planes.count).to eq 1
    plane.take_off(weather, subject)
    subject.release(plane)
    expect(subject.planes.count).to eq 0
  end

end
