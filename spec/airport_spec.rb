require 'spec_helper'
require './lib/airport'
require './lib/plane'

describe Airport do 
		#This is to check for for the capacity of the airport
		#in order to prevent landing
	subject { described_class.new(capacity: 20)}
	let(:plane) {Plane.new}

	it 'Lets plane land' do
    allow(subject).to receive(:weather) { 'fine' }
	  plane.land?
	  expect { subject.land(plane) }.to change { subject.count_plane }.by 1
	end

	it 'Does not let planes land and raises error when full' do
    allow(subject).to receive(:weather) { 'fine' }
	  20.times { subject.land(plane) }
	  expect { subject.land(plane) }.to raise_error('does not let plane land')
	end

  it 'Once plane has taken off it is no longer in the airport' do
    allow(subject).to receive(:weather) { 'fine' }
    subject.land(plane)
    expect { subject.taking_off(plane) }.to change {subject.count_plane}.by (-1)
  end

  it 'Does not let planes land when weather is stormy and raises error' do
    allow(subject).to receive(:stormy?).and_return(true)
    # subject.stormy?
    expect { subject.land(plane) }.to raise_error("Bad weather")
  end
end