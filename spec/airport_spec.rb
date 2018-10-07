require 'airport'
require 'weather'

describe Airport do
  it { is_expected.to respond_to :land }

  it 'returns the plane has landed' do
    plane = Plane.new
    expect(subject.land(plane)).not_to eq nil
  end

  it 'returns plane has taken off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "Plane has taken off"
  end

  #it 'returns plane has not taken off due to stormy weather' do
  #  weather = Weather.new
  #  plane = Plane.new
  #  allow(weather).to receive(:stormy).and_return true
    #expect{ subject.take_off(plane) }.to raise_error "Unable to take off due to bad weather!"
  #end

  #it 'returns plane has taken off weather was good!' do
    #  weather = Weather.new
    #  plane = Plane.new
    #  allow(weather).to receive(:stormy).and_return false
    #  expect{ subject.take_off(plane) }.not_to raise_error "Unable to take off due to bad weather!"
  #end

end
