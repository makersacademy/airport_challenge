require 'spec_helper'

describe Airport do

  let(:plane) { double(:plane) }
  it "lands a plane in the airport and stores it" do
    expect(subject.land(plane)).to match_array(plane)
  end

  it "allows the plane to take off and leaves the airport" do
    subject.land(plane)
    subject.take_off
    expect(subject.empty?).to eq(true)
  end

  it 'errors when the airport is full' do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(plane)
    end
    expect { subject.land(plane) }.to raise_error 'Airport is at capacity'
  end
end
