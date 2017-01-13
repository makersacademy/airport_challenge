require "airport"

 describe Airport do
   subject(:airport) { described_class.new(20) }
   let(:plane) { double :plane }

   describe '#land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it "does not allow landing when at capacity" do
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full."
        end
      end
    end

      context 'when stormy' do
        it 'raises an error if asked to land a plane when stormy' do
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy."
       end
     end

    describe '#take-off' do
      it "instructs a plane to take-off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

end
end
