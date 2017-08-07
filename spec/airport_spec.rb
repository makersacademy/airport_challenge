require './lib/plane_class.rb'
require './lib/airport_class.rb'
require './lib/weather_class.rb'

describe Airport do
  let('plane') { double :plane }
  let('weather') { double :weather }
  before do
    allow(Weather).to receive(:new) { weather }
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off) {airport.remove_from_roster plane}
  end
  subject(:airport) { described_class.new }

  it 'denies landing when weather is stormy' do
    allow(weather).to receive(:stormy?) { true }
    expect { subject.land plane }.to raise_error("Stormy weather")
  end

  it 'lands plane when weather is fine' do
    allow(weather).to receive(:stormy?) { false }
    subject.land plane
    expect(subject.here? plane).to eq true
  end

  it 'denies take off when weather is stormy' do
    allow(weather).to receive(:stormy?) { false }
    subject.land plane
    allow(weather).to receive(:stormy?) { true }
    expect { subject.take_off plane }.to raise_error("Stormy weather")
  end

  it 'taken off plane removed from planes' do
    allow(weather).to receive(:stormy?) { false }
    subject.land plane
    allow(weather).to receive(:stormy?) { false }
    subject.take_off plane
    expect(subject.here? plane).to eq false
  end
end
