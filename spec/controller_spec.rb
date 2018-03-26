require_relative '../lib/controller'

describe Controller do

  subject(:controller) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'does not allow plane to land in stormy weather' do
    plane = double(:plane)
    subject.weather = double(:weather, stormy?: true)
    expect{ subject.land(plane) }.to raise_error 'Can not land due to bad weather conditions'
  end

  it 'does not allow plane to land when airport is full' do
    plane = double(:plane)
    subject.airport = double(:airport, full?: true)
    expect{ subject.land(plane) }.to raise_error 'Airport full!'
  end

  it 'does not allow plane to take off in stormy weather' do
    plane = double(:plane)
    subject.weather = double(:weather, stormy?: true)
    expect{ subject.take_off(plane) }.to raise_error 'Can not take off due to bad weather conditions'
  end

end
