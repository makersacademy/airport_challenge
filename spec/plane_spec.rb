require_relative '../docs/plane.rb'
require 'pry'

describe Plane do

  it 'can land at an airport' do
    expect(subject.respond_to?(:land)).to eq true
  end

  it 'can takeoff from an airport' do
    expect(subject.respond_to?(:takeoff)).to eq true
  end

  it 'can confirm that once its taken off its no longer at the airport' do
    expect(subject.status).to eq "flying"
  end

  it 'can confirm when in airport that its at the airport' do
    plane = Plane.new
    plane.land
    expect(plane.status).to eq "airport"
  end

end
