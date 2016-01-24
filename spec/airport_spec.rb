require 'airport'

describe Airport do

let(:plane) {double(:plane, :land => false, :take_off => true)}
let(:weather) {double(:weather)}
subject(:Airport) {described_class.new weather}

  it 'can request a plane to land and confirm when landed' do
    allow(weather).to receive(:storm).and_return(false)
    subject.request_land(plane)
    expect(subject.planes).to include plane
  end

  it 'can instruct a plane to take off and confirm when left' do
    allow(weather).to receive(:storm).and_return(false)
    subject.request_take_off(plane)
    expect(subject.planes).not_to include plane
  end

  it 'can prevent a plane take-off during stormy weather' do
    allow(weather).to receive(:conjure_storm).and_return(true)
    allow(weather).to receive(:storm).and_return(true)
    weather.conjure_storm
    expect {subject.request_take_off(plane)}.to raise_error("Planes cannot take off in a storm.")
  end
  it 'can prevent a plane landing during stormy weather' do
    allow(weather).to receive(:conjure_storm).and_return(true)
    allow(weather).to receive(:storm).and_return(true)
    weather.conjure_storm
    expect {subject.request_land(plane)}.to raise_error("Planes cannot land in a storm.")

  end

end
