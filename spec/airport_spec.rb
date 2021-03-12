require 'spec_helper'
require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'plane is at airport when landing' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to eq([plane])
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }  
end
