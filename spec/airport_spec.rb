require 'spec_helper'
require './lib/airport'
require './lib/plane'

describe Airport do 
		#This is to check for for the capacity of the airport
		#in order to prevent landing
	subject { described_class.new(capacity: 20)}
	let(:plane) {Plane.new}

	it 'Lets plane land' do
    allow(subject).to receive(:stormy?).and_return(false)
	  plane.land?
	  expect { subject.land(plane) }.to change { subject.count_plane }.by 1
	end

	it 'Does not let planes land and raises error when full' do
    allow(subject).to receive(:stormy?).and_return(false)
	  20.times { subject.land(plane) }
	  expect { subject.land(plane) }.to raise_error('does not let plane land')
	end

  it 'Once plane has taken off it is no longer in the airport' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect { subject.taking_off(plane) }.to change {subject.count_plane}.by (-1)
  end

  it 'Does not let planes land when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.land(plane) }.to raise_error("Bad weather")
  end

    it 'Does not let planes take-off when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.taking_off(plane) }.to raise_error("Bad weather")
  end

end