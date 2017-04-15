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
    airport = double('airport', :planes => [])
    subject.land(airport)
    expect(subject.confirm_status).to eq 'landed'
  end

  it 'take off from an airport and confirm that it is no longer in the airport' do
    weather = double('weather', :status => 'sunny')
    subject.take_off(weather)
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'can take off when instructed' do
    weather = double('weather', :status => 'sunny')
    subject.take_off(weather)
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'can land at a specific airport' do
    airport = double('airport', :planes => [])
    subject.land(airport)
  end

  it 'can take off in sunny weather' do
    weather = double('weather', :status => 'sunny')
    expect { subject.take_off(weather) }.not_to raise_error
    expect(subject.confirm_status).to eq 'in air'
  end

  it 'cannot take off when weather is stormy' do
    weather = double('weather', :status => 'stormy')
  end


end
