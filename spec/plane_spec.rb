require_relative '../docs/plane.rb'

describe Plane do

  it 'can land at an airport' do
    expect(subject.respond_to?(:land)).to eq true
  end

  it 'can takeoff from an airport' do
    expect(subject.respond_to?(:takeoff)).to eq true
  end

  it 'can confirm that once its taken off its no longer at the airport' do
    expect(subject.whereabouts).to eq "flying"
  end

end
