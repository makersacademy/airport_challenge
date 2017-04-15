require 'plane'

describe Plane do

  it 'can land' do
    expect(subject).to respond_to :land
  end

  it 'can take-off' do
    expect(subject).to respond_to :take_off
  end

  it 'can confirm its status' do
    expect(subject).to respond_to :confirm_status
  end

  it 'can land at an airport and confirm that it has landed' do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :planes => [], :capacity => 20, :full? => false, :receive => [])
    subject.land(weather, airport)
    expect(subject.confirm_status).to eq 'landed'
  end

  it 'take off from an airport and confirm that it is no longer in the airport' do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :release => subject, :planes => [subject])
    subject.take_off(weather, airport)
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'can take off when instructed' do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :full? => false, :release => [], :planes => [subject])
    subject.take_off(weather, airport)
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'can land at a specific airport' do
    airport = double('airport', :planes => [], :full? => false, :receive => [])
    weather = double('weather', :status => 'sunny')
    subject.land(weather, airport)
  end

  it 'can take off in sunny weather' do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :full? => false, :release => [], :planes => [subject])
    expect { subject.take_off(weather, airport) }.not_to raise_error
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'cannot take off when weather is stormy' do
    weather = double('weather', :status => 'stormy')
    airport = double('airport', :planes => [], :full? => false)
    expect { subject.land(weather, airport) }.to raise_error "Cannot land in stormy weather"
  end

  it 'cannot take land when weather is stormy' do
    weather = double('weather', :status => 'stormy')
    airport = double('airport', :planes => [], :full? => false)
    expect { subject.land(weather, airport) }.to raise_error "Cannot land in stormy weather"
  end

  it 'cannot land when the airport is full' do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :full? => true, :receive => [])    
    expect { subject.land(weather, airport) }.to raise_error "Airport is at capacity"
  end

  it 'can only take_off from airports that they are in' do
    weather = double('weather', :status => 'sunny')
    airport1 = double('airport', :planes => [], :full? => false, :receive => [])
    airport2 = double('airport', :planes => [], :full? => false, :release => [])
    subject.land(weather, airport1)
    expect { subject.take_off(weather, airport2) }.to raise_error "I am not in that airport"
  end

  it "can only take_off if it's status is not 'in air'" do
    weather = double('weather', :status => 'sunny')
    airport = double('airport', :planes => [], :full? => false, :release => [subject])
    expect { subject.take_off(weather, airport) }.to raise_error "I am not in that airport"
  end

end
