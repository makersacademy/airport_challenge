require 'plane'

describe Plane do

  it 'lands on command' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'takes-off on command' do
    expect(subject).to respond_to(:take_off)
  end




end
