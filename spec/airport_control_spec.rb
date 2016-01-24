require 'air_traffic_control'
require_relative 'plane_container_spec'

describe AirTrafficControl do
  subject(:AirTrafficControl) {described_class.new}
	let(:plane) { double :plane }
  let(:airport) { double :airport }

  it_behaves_like PlaneContainer

#responds to methods in class
  it { is_expected.to respond_to(:instruct_land).with(2).argument }
  it { is_expected.to respond_to(:instruct_takeoff).with(2).argument }

#wrap in non-stormy weather/other condition
  describe 'stub main conditions for tests' do
    before do
      allow(AirTrafficControl).to receive(:stormy?).and_return(false)
      allow_any_instance_of(AirTrafficControl).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:land)
      allow(airport).to receive(:takeoff)
      allow(airport).to receive(:full?).and_return(false)
      allow(AirTrafficControl).to receive(:airport_match).and_return(true)
      allow_any_instance_of(AirTrafficControl).to receive(:airport_match).and_return(true)

    end
    describe 'stub landing conditions' do
      before do
        allow(AirTrafficControl).to receive(:airplane_status_check).and_return(false)
        allow_any_instance_of(AirTrafficControl).to receive(:airplane_status_check).and_return(false)
      end
      it 'check weather stubbed when called' do
        expect(subject.stormy?).to eq false
      end

    # #instance takes set capacity
    #   describe '#initialize' do
    #     it 'sets random capacity' do
    #       random = rand(1..AirTrafficControl::DEFAULT_CAPACITY)
    #       control = AirTrafficControl.new(random)
    #       expect(control.capacity).to eq random
    #     end
    #   end

    #instruct a plane to land
      describe '#instruct_land' do
        it 'returns plane removed from inflight' do
          subject.instruct_takeoff(plane, airport)
          expect(subject.instruct_land(plane, airport)).to eq plane
        end
      end

      describe '#instruct_land' do
        it 'check plane no longer inflight' do
          subject.instruct_takeoff(plane, airport)
          subject.instruct_land(plane, airport)
     	    expect(subject.display_inflight).not_to include(plane)
        end
      end

      describe '#instruct_land' do
        it 'check plane class receives instruction to land' do
          expect(airport).to receive(:land)
          subject.instruct_land(plane, airport)
        end
      end

    #prevent landing if airport is full
      describe '#instruct_land' do
        it 'display error if airport is full' do
          allow(airport).to receive(:full?).and_return(true)
          expect { subject.instruct_land(plane, airport) }.to raise_error('Airport is full')
        end
      end

      describe '#instruct_land' do
        it 'check airport class for full?' do
          expect(airport).to receive(:full?)
          subject.instruct_land(plane, airport)
        end
      end

    #prevent landing if stormy
      describe '#instruct_land' do
        it 'display error if stormy' do
          allow(AirTrafficControl).to receive(:stormy?).and_return(true)
          allow_any_instance_of(AirTrafficControl).to receive(:stormy?).and_return(true)
          expect { subject.instruct_land(plane, airport) }.to raise_error('Too stormy to land')
        end
      end

      describe'#instruct_land' do
        it 'error if plane already landed' do
          allow(AirTrafficControl).to receive(:airplane_status_check).and_return(true)
          allow_any_instance_of(AirTrafficControl).to receive(:airplane_status_check).and_return(true)
          expect { subject.instruct_land(plane, airport) }.to raise_error('Plane already landed')
        end
      end
    end
    #end landing condition wrapper

    #open takeoff condition wrapper
    describe 'stub takeoff conditions' do
      before do
        allow(AirTrafficControl).to receive(:airplane_status_check).and_return(false)
        allow_any_instance_of(AirTrafficControl).to receive(:airplane_status_check).and_return(false)
      end

    #instruct plane to take-off
      describe '#instruct_takeoff' do
        it 'check plane is inflight' do
          subject.instruct_takeoff(plane, airport)
          expect(subject.display_inflight).to include(plane)
        end
      end

      describe '#instruct_takeoff' do
        it 'check plane class receives instruction to takeoff' do
          expect(airport).to receive(:takeoff)
          subject.instruct_takeoff(plane, airport)
        end
      end

      describe'#instruct_takeoff' do
        it 'error if plane is not at correct airport' do
          allow(AirTrafficControl).to receive(:airport_match).and_return(false)
          allow_any_instance_of(AirTrafficControl).to receive(:airport_match).and_return(false)
          expect { subject.instruct_takeoff(plane, airport) }.to raise_error('Plane is not located here')
        end
      end

      describe'#instruct_takeoff' do
        it 'error if plane is already inflight' do
          allow(AirTrafficControl).to receive(:airplane_status_check).and_return(true)
          allow_any_instance_of(AirTrafficControl).to receive(:airplane_status_check).and_return(true)
          expect { subject.instruct_takeoff(plane, airport) }.to raise_error('Plane already inflight')
        end
      end

      #prevent take-off if stormy
      describe '#instruct_takeoff' do
        it 'display error if stormy' do
          allow(AirTrafficControl).to receive(:stormy?).and_return(true)
          allow_any_instance_of(AirTrafficControl).to receive(:stormy?).and_return(true)
          expect { subject.instruct_takeoff(plane, airport) }.to raise_error('Too stormy to take-off')
        end
      end
    end
  end
end
