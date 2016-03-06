require 'airport.rb'

describe Airport do

  let(:plane) { double(:plane,flying:true) }

  describe '#instruct_to_land' do
    it 'responds to instruct_to_land' do
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end
    # it { is_expected.to respond_to(:instruct_to_land) }
    it 'calls the land method on passed argument (plane)' do
      allow(plane).to receive(:land)
      subject.instruct_to_land(plane)
    end

    # it 'reports confirmation that a landing has taken place' do
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


  end
end
