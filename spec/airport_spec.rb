require "airport"

describe Airport do
    subject(:airport) { described_class.new(40, weather_reporter) }
    let(:plane) { double :plane }
    let(:weather_reporter) { double :weather_reporter }

    describe "#land" do
        context 'when not stormy' do
            before do
               allow(weather_reporter).to receive(:stormy?).and_return false
            end

            it "#ask plane to land" do
                expect(airport).to respond_to(:land).with(1).argument
            end
          end
    
        context 'when full' do
        it 'raise_error #does_not land' do
          40.times { airport.land(:plane) } # land so the capacity is filled
            expect { airport.land(:plane) }.to raise_error 'this airport is full'
        end
      end
  #  end
end

    context 'when stormy' do
      it "raises an error" do
        # weather_reporter = Weather_reporter.new
         allow(weather_reporter).to receive(:stormy?).and_return true
           expect { airport.land(plane) }.to raise_error "stormy weather, cannot land"
          end
       end

    describe "take_off" do 
      context 'when not stormy' do
        it "#ask plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
        end
    end
    end

    context 'when stormy' do
        before do
          allow(weather_reporter).to receive(:stormy?).and_return true
        end
           it "raises an error" do
            expect { airport.take_off(plane) }.to raise_error "stormy weather, cannot take off"
        end
    end
end



