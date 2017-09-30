require 'plane'

describe Plane do
  let(:airport_with_plane) { double(:airport, :register_departure => true, :check_for_plane => true, :name => 'Sydney') }
  let(:airport_without_plane) { double(:airport, :register_arrival => true, :check_for_plane => false, :name => 'Berlin') }
  let(:fine_weather) { double(:weather, :stormy => false) }
  let(:stormy_weather) { double(:weather, :stormy => true) }

  it 'is not airborne at first' do
    expect(subject.airborne).to eq false
  end

  it 'has an initial airport location which defaults to Heathrow' do
    expect(subject.location).to eq 'Heathrow'
  end

  it 'reports that it is not airborne after being instructed to land at an airport' do
    subject.take_off airport_with_plane, fine_weather
    subject.land_at airport_without_plane, fine_weather
    expect(subject.airborne).to eq false
  end

  it 'reports that it is airborne after being told to take off' do
    subject.take_off airport_with_plane, fine_weather
    expect(subject.airborne).to eq true
  end

  it 'can is not airborne at first' do
    expect(subject.airborne).to eq false
  end

  it 'can be told to fly to an airport' do
    subject.take_off airport_with_plane, fine_weather
    subject.land_at airport_without_plane, fine_weather
    expect(subject.location).to eq airport_without_plane.name
  end

  it 'won\'t fly to an airport that it is already at' do
    expect { subject.land_at airport_with_plane, fine_weather }.to raise_error 'Already at airport'
  end

  it 'can be told to take off from an airport' do
    subject.take_off airport_with_plane, fine_weather
    expect(subject.location).to eq 'in_flight'
  end

  it 'won\'t take off from an airport that it is not parked at' do
    expect { subject.take_off airport_without_plane, fine_weather }.to raise_error 'Not parked at airport'
  end

  it 'can\'t be told to take off if it is already airborne' do
    subject.take_off airport_with_plane, fine_weather
    expect { subject.take_off airport_with_plane, fine_weather }.to raise_error 'Already in the air'
  end

  it 'can\'t be told to land if it is not airborne' do
    expect { subject.land_at airport_without_plane, fine_weather }.to raise_error 'Not in the air'
  end

  it "won't take off if the weather is stormy" do
    expect { subject.take_off(airport_with_plane, stormy_weather) }.to raise_error 'Too dangerous to take off'
  end

  it "won't land if the weather is stormy" do
    subject.take_off airport_with_plane, fine_weather
    expect { subject.land_at(airport_without_plane, stormy_weather) }.to raise_error 'Too dangerous to land'
  end

end
