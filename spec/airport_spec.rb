require 'airport'

describe Airport do
  subject(:airport) {described_class.new(2) }
  let(:plane) { double :plane}

  describe '#land' do
    it "Instructs a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end


    context 'When full' do
      it "Will not allow landing" do
        2.times do
          airport.land(:plane)
        end
        expect {airport.land(:plane)}.to raise_error "Cannot land - Airport full!"
      end
    end
  end

  describe '#takeoff' do
    it "Instructs a plane to takeoff" do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end
  end
end
