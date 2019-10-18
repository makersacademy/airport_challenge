# frozen_string_literal: true

require 'airport'

describe Airport do
  # Creating plane double
  let(:plane) { double :plane }

  # Testing response to method land
  it { is_expected.to respond_to(:land).with(1).argument }

  # Testing plane landing
  it 'lets a plane land' do
    expect(subject).to receive(:land)
    subject.land(plane)
  end

  # Testing airport has plane after landing
  it 'has the plane after landing' do
    allow(plane).to receive(:land)
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  # Testing response to method take_off
  it { is_expected.to respond_to(:take_off).with(1).argument }

  # Testing plane taking off
  it 'lets a plane take off' do
    expect(subject).to respond_to(:take_off)
  end
end
