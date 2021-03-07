require './lib/airport'
require './lib/planes'
require './lib/weather'

describe Airport do
  let(:plane) { double :plane, :landed= => false, landed?: false }
  let(:weather) { double :weather, :sunny= => true, sunny?: true }
  let(:airport) { Airport.new }

  describe "instruct_to_land" do
    it { is_expected.to respond_to(:instruct_to_land).with(1).argument }
    it "prevents landing if airport is full" do
      allow(plane).to receive(:instruct_to_land).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.instruct_to_land(plane) }
      expect { subject.instruct_to_land(plane) }.to raise_error "CANNOT LAND, AIRPORT AT CAPACITY"
    end
      it 'will not allow a plane to take off when it is stormy' do
       allow(weather).to receive(:sunny?).and_return false
       expect { airport.instruct_to_take_off(plane) }.to raise_error("It is too stormy to fly")
     end
  end

  describe "instruct_to_take_off" do
    it { is_expected.to respond_to(:instruct_to_take_off).with(1).argument }
    it 'will not allow a plane to land when it is stormy' do
     allow(weather).to receive(:sunny?).and_return false
     expect { airport.instruct_to_land(plane) }.to raise_error("It is too stormy to fly")
   end
  end
end
