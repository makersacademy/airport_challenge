require "airport"

describe Airport do
    subject(:airport) { described_class.new(40) }
    let(:plane) { double :plane }

    describe "#land" do
        context 'when not stormy' do
            before do
                allow(airport).to receive(:stormy?).and_return false
            end

        it "#ask plane to land" do
            expect(airport).to respond_to(:land)
        end
    
        context 'when full' do
        it 'raise_error #does_not land' do
          40.times { airport.land(:plane) } # land so the capacity is filled
            expect { airport.land(:plane) }.to raise_error 'this airport is full'
        end
    end
    end
end

    context 'when stormy' do
      it "does not not allow planes to land" do
         allow(airport).to receive(:stormy?).and_return true
           expect { airport.land(plane)}.to raise_error "stormy weather, cannot land"
          end
       end

    describe "take_off" do 
        it "#ask plane to take off" do
        expect(airport).to respond_to(:take_off)
        end
    end
end



