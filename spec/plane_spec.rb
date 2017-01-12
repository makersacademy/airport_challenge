require 'plane'
require 'airport'

describe Plane do
  subject(:plane) {described_class.new}
  let(:weather) {double :weather}

  describe '#Landing Planes' do

  before(:each) do
    allow(weather).to receive(:stormy?).and_return(false)
  end

    it 'plane flying status is false when landed' do
      expect(plane.land).to be_falsy
    end

    it 'expect plane status to confirm plane has landed if landed' do
      airport = Airport.new(2, weather)
      airport.instruct_landing(plane)
      expect(plane.status).to eq("The plane has landed")
    end
  end

  describe '#Planes Taking Off' do

  before(:each) do
    allow(weather).to receive(:stormy?) {false}
  end

    it 'plane flying status is true when taken off' do
      expect(plane.taken_off).to be_truthy
    end

    it 'expect plane status to confirm plane has taken off if taken off' do
      airport = Airport.new(2, weather)
      airport.instruct_landing(plane)
      airport.instruct_take_off(plane)
      expect(plane.status).to eq("The plane has taken off")
    end
  end
end
