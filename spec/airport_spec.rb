require 'airport'

describe Airport do
		subject(:airport) { described_class.new }
    let(:plane) { double :plane } # creating Doubles.

    describe '#to_land' do
        before do
          allow(airport).to receive(:stormy?).and_return(false)
        end
        it 'Instructs a plane to land.' do
						expect(airport).to respond_to(:to_land).with(1).argument # responds to 'to_land' method with '1' argument, in this case 'plane'.
        end 
        context 'Abort when' do
            it 'full airport' do # raise an error if airport is full (Default capacity - see airport.rb)
              airport.capacity.times { airport.to_land(plane) }
              expect { airport.to_land(plane) }.to raise_error "Abort landing: Airport is full."
            end
            it 'storm' do
                allow(airport).to receive(:stormy?).and_return(true)
                expect { airport.to_land(plane) }.to raise_error "Abort to land: Storm hapenning."
            end
        end
    end
        
    describe '#take_off' do
        before do
          allow(airport).to receive(:stormy?).and_return(false)
        end
				it 'Instructs a plane to take off' do
					  expect(airport).to respond_to(:take_off) # responds to 'take_off' method. 
        end
        context 'Abort when' do
            it 'empty airport' do # raise an error to take off if there is 0 planes in the airport
              expect { airport.take_off }.to raise_error "No planes to take off: Airport is empty." 
            end
            it 'storm' do
                allow(airport).to receive(:stormy?).and_return(true)
                expect { airport.take_off }.to raise_error "Abort to take off: Storm hapenning."
            end
        end
    end
    
    		# storm
		describe '# storm' do
      # it { is_expected.to respond_to :stormy? } # simply way to check if our method respond 
      it 'may happen...' do
          allow(airport).to receive(:rand).and_return(8) # creating Stub.
          expect(airport.stormy?).to eq(true)
      end
  end

		# describe a default capacity for Airport
		# describe 'Initialization' do
		# 		subject { Airport.new }
		# 		let(:plane) { Plane.new }
		# 		it 'default capacity' do
		# 				described_class::DEFAULT_CAPACITY.times do
		# 						subject.to_land(plane)
		# 				end
		# 				expect { subject.to_land(plane) }.to raise_error "Abort to land. Full airport."
		# 		end

		# 		it { expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY }
    # end	
    
    # it 'return a plane object' do # plane was instructed to land.
    #   airport.to_land(plane)
    #   expect(airport.take_off).to eq(plane) # takes off a plane, that landed before.
    # end
end 
