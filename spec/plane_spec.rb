require 'plane'

RSpec.describe Plane do

  it {is_expected.to respond_to(:land)}

  it {is_expected.to respond_to(:in_air)}

  it 'should be initialized with #in_air as false' do
    expect(subject.in_air).to eq false
  end

  it '#land should land a plane in runway' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    plane = Plane.new(true)
    airport = double(:airport)
    allow(airport).to receive(:capacity) {100}
    allow(airport).to receive(:run_way) {[]}
    allow(airport).to receive(:airport_check) {plane}
    expect(plane.land(airport,plane)).to eq([plane])
  end

  it '#take_of should take of a plane' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    airport = double(:airport)
    allow(airport).to receive(:run_way) {[subject,'error']}
    allow(airport).to receive(:airport_check) {subject}
    expect(subject.take_of(airport,subject)).to eq(subject)
  end

  it 'expect #in_air status to go false when landed' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}

    plane = Plane.new(true)
    airport = double(:airport)
    allow(airport).to receive(:run_way) {[]}
    allow(airport).to receive(:capacity) {100}
    allow(airport).to receive(:airport_check) {plane}
    plane.land(airport,plane)
    expect(plane.in_air).to eq false
  end

  it 'expects #in_air status to go to true when taken of' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    airport = double(:airport)
    allow(airport).to receive(:run_way) {[subject]}
    allow(airport).to receive(:airport_check) {subject}
    subject.take_of(airport,subject)
    expect(subject.in_air).to eq true
  end


  it 'raises' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    airport = double(:airport)
    allow(airport).to receive(:run_way) {[]}
    allow(airport).to receive(:capacity) {100}
    allow(airport).to receive(:airport_check) {subject}
    expect {subject.land(airport,subject)}.to raise_error "plane already in airport"
  end

  it 'raises' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'sunny'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    plane = Plane.new(true)
    airport = double(:airport)
    allow(airport).to receive(:run_way) {[]}
    allow(airport).to receive(:airport_check) {plane}
    expect {plane.take_of(airport,plane)}.to raise_error "plane already in air"
  end


  it 'raises' do
    weather = double(:weather)
    allow(weather).to receive(:status) {'stormy'}
    weathers = class_double("Weather").as_stubbed_const
    allow(weathers).to receive(:new) {weather}
    airport = double(:airport)
    allow(airport).to receive(:capacity) {100}
    allow(airport).to receive(:run_way) {[subject]}
    expect {subject.land(airport,subject)}.to raise_error "bad weather"
  end
end
