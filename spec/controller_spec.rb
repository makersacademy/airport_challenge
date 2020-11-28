require 'controller'
require 'airport'
require 'weather'
require 'plane'

describe Controller do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'checks capacity of the airport' do
    expect(subject.check_capacity).to eq true
  end

  it 'checks the weather' do
    allow(subject.weather).to receive(:generate).and_return(:sunny)
    expect(subject.check_weather).to eql true
  end

  it 'instructs landing if weather = sunny, airport != full' do
    allow(subject).to receive(:check_weather).and_return(true)
    allow(subject).to receive(:check_capacity).and_return(true)
    expect { subject.check_landing(plane) } .to output("successful landing.\n").to_stdout
  end

  it 'prevents landing if weather is stormy' do
    allow(subject).to receive(:check_weather).and_return(false)
    expect(subject.check_landing(plane)).to eq 'Sorry! The plane cannot land at the moment.'
  end

  it 'prevents take-off if weather is stormy' do
    allow(subject).to receive(:check_weather).and_return(false)
    expect(subject.check_takeoff(plane)).to eq 'Sorry! The plane cannot take off at the moment.'
  end

  it 'allows take-off if the weather is sunny' do
    allow(subject).to receive(:check_weather).and_return(true)
    expect { subject.check_takeoff(plane) } .to output("take-off successful.\n").to_stdout
  end

  it 'lands the airport in the airport' do
    subject.land(plane)
    expect(subject.airport.ramp).to eq([plane])
  end

end
