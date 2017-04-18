require 'airport.rb'

describe Airport do

  let(:plane) { double(:plane,flying:true) }

  describe '#instruct_to_land' do
    it 'responds to instruct_to_land' do
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
      # it { is_expected.to respond_to(:instruct_to_land) }
    end

    it 'calls the land method on passed argument (plane)' do
      # allow(plane).to receive(:land)
      # allow(plane).to receive(:is_flying?)
      plane = Plane.new
      subject.instruct_to_land(plane)
      expect(plane.is_flying?).to eq false
    end

    # it 'reports confirmation that a landing has taken place' do     #TODO
    #   expect(subject.instruct_to_land(plane)).to return("An airplane has landed.")
    # end
  end


  describe '#@capacity' do
    it 'provides an area for planes to land in' do
      # or responds to .capacity
      expect(subject.capacity).to be_a(Array)
    end

    it 'receives landed planes into @capacity array' do
      allow(plane).to receive(:land)
      subject.instruct_to_land(plane)
      expect(subject.capacity.size).to be > 0
    end

    describe '#instruct_takeoff' do
      it 'responds to instruct_takeoff' do
        expect(subject).to respond_to(:instruct_takeoff).with(1).argument
      end

      it 'calls the takeoff method on passed argument(plane)' do  #TODO
        # allow(plane).to receive(:is_flying?)
        # allow(plane).to receive(:land)
        # subject.instruct_to_land(plane)
        # allow(plane).to receive(:takeoff)
        plane = Plane.new
        subject.instruct_takeoff(plane)
        expect(plane.is_flying?).to eq true
      end

      it 'can confirm that (plane) is no longer in airport @capacity' do
        plane = Plane.new
        subject.instruct_to_land(plane)
        expect(subject.capacity.size).to be > 0
        subject.instruct_takeoff(plane)
        expect(subject.capacity.size).to eq(0)
      end

    end


  end
end
