require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe 'landing planes' do
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      subject.land plane
    end

    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.instance_variable_get(@hangar)).to include plane
    end
  end

  it 'the plane is no longer in hangar after take off' do
    allow(plane).to receive(:land)
    allow(weather).to receive(:stormy?).and_return(false)
    airport.take_off(plane)
    expect(airport.instance_variable_get(@hangar)).not_to include(plane)
  end
  it 'does not allow plane to take off due to storm' do
    allow(weather).to receive(:stormy?).and_return(true)
    no_take_off = 'Cannot take off due to stormy weather'
    expect{subject.take_off(plane)}.to raise_error no_take_off
  end
end
