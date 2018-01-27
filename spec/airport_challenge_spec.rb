# frozen_string_literal: true

# This is my unit test document!

require 'airport'

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport [Y]
# and confirm that it is no longer in the airport [?]

describe Airport do
  let(:plane) { :plane }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'allows planes to land & be added to the airport hangar' do
    expect(subject.landing(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    subject.landing(plane)
    expect(subject.take_off(plane)).to eq "#{plane} has taken off!"
  end
end
