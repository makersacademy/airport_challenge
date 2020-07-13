require "airport"

describe Airport do
    subject(:airport) { described_class.new(40) }
    let(:plane) { double :plane }

    describe "#land" do
        context 'when not stormy' do
        it "#ask plane to land" do
            allow(airport).to receive(:stormy?).and_return false
            expect(airport).to respond_to(:land).with(1).argument
        end
    

        it '#does_not land when airport full' do
            allow(airport).to receive(:stormy?).and_return false
          40.times { airport.land(:plane) } # land so the capacity is filled
            expect { airport.land(:plane) }.to raise_error 'this airport is full'
        end
    end
end

    context 'when stormy' do
      it "does not not allow planes to land when stormy" do
         allow(airport).to receive(:stormy?).and_return true
           expect { airport.land(plane)}.to raise_error "stormy weather, cannot land"
          end
       end

    describe "take_off" do 
        it "#ask plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
        end
    end
end



