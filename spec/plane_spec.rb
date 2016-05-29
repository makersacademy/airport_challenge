require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe "#take_off" do

    it { is_expected.to respond_to :take_off }

    it "raises an error if plane already flying" do
      expect { plane.take_off }.to raise_error "Plane cannot take-off: plane already flying"
    end

  end

  describe "#land" do

    it "remembers the current airport at which it is landed" do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end

# #   #   it "raises an error if already landed at same airport" do
# #   #     plane.land(airport)
# #   #     expect { plane.land(airport) }.to raise_error "Plane cannot land: already landed at this airport"
# #   #   end

  end

# #   # describe "#airport" do

# #   #   it { is_expected.to respond_to :airport }

# #   #   it "raises an error if already flying" do
# #   #     expect { plane.airport }.to raise_error "Plane cannnot be at an airport: plane already flying"
# #   #   end
# #   # end

end