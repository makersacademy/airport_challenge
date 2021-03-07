require './lib/airport'
require './lib/planes'
require './lib/weather'

describe Airport do
  let(:plane) { double :plane, :landed= => false, landed?: false }
  let(:weather) { double :weather, :sunny= => true, sunny?: true }

  describe "instruct_to_land" do
    it { is_expected.to respond_to(:instruct_to_land).with(1).argument }
    it "prevents landing if airport is full" do
      allow(plane).to receive(:instruct_to_land).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.instruct_to_land(plane) }
      expect { subject.instruct_to_land(plane) }.to raise_error "CANNOT LAND, AIRPORT AT CAPACITY"
    end
    #  it 'will not allow a plane to take off when it is stormy' do
      # allow(weather).to receive(:sunny?).and_return false
    #   expect { subject.instruct_to_take_off(plane) }.to raise_error("It is too stormy to fly")
    # end

    it "Prevent airplane to take off if not sunny" do
   subject.sunny
   allow(airplane).to receive(:landed).and_return(false)
   subject.land_plane(airplane)
   subject.sunny = false
   error = "Weather Stormy cannot take off"
   expect{subject.takeoff_plane(airplane)}.to raise_error error
 end
  end

  describe "instruct_to_take_off" do
    it { is_expected.to respond_to(:instruct_to_take_off).with(1).argument }
    #it 'will not allow a plane to land when it is stormy' do
    # allow(weather).to receive(:sunny?).and_return false
    # expect { subject.instruct_to_land(plane) }.to raise_error("It is too stormy to fly")

    it "Prevent airplane to land if not sunny" do
       subject.sunny
       error =  "Weather Stormy cannot land"
       expect{subject.land_plane(airplane)}.to raise_error error
     end

   end
  end
