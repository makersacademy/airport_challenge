require 'plane'

describe Plane do
    let(:airport) { double(:airport) }
    let(:sunny_airport) { double(:airport, weather: 'clear') }
    let(:stormy_airport) { double(:airport, weather: 'stormy') }
  it 'lands somewhere' do
    subject.land(sunny_airport)
    expect(subject.state).to eq 'grounded'
  end
  it 'takes off' do
    subject.take_off
    expect(subject.state).to eq 'flying'
  end
  it 'confirms state after take off' do
    subject.take_off
    expect(subject.confirm).to eq 'flying'
  end
  it 'confirms state after landing' do
    subject.land(airport)
    expect(subject.confirm).to eq 'grounded'
  end
  it 'knows where it\'s grounded' do
    location = ('a'..'z').to_a.shuffle[0,rand(10) + 1].join
    subject.land(location)
    expect(subject.location).to eq location
  end
  it 'knows that it\'s airborne' do
    subject.take_off
    expect(subject.location).to eq 'airborne'
  end
end
