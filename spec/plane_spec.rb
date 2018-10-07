require 'plane'

describe Plane do
  let(:airport) { double :airport }

  it 'creates an instance of plane' do
    expect(subject).to be_an_instance_of(Plane)
  end

  it 'should be flying until they have landed' do
    airport = Airport.new
    expect(subject.flying).to eq true
    # allow(airport).to receive(:land_plane).and_return(false)
    # allow(bike).to receive(:working?).and_return(true) <<<SYNTAX REF
    airport.land_plane(subject)
    expect(subject.flying).to eq false
  end

  it 'should be grounded after landing, and until takeoff' do
    airport = Airport.new
    airport.land_plane(subject)
    expect(subject.flying).to eq false
    airport.take_off(subject)
    expect(subject.flying).to eq true
  end

end
