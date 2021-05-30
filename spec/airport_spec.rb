require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  it { is_expected.to respond_to(:land).with(1).argument }
  #it { is_expected.to respond_to(:landed?) }
  
 
      it 'instructs a plane to take off from an airport' do
        plane = double(:plane, report_take_off: true)
        allow(plane).to receive(:take_off)
        subject.land(plane)
        subject.take_off(plane)
        plane.report_take_off
        expect(subject.planes).not_to include plane
      end

      it 'is expected to confirm that it is no longer in the airport' do
        plane = double(:plane, report_take_off: true)
        expect(plane.report_take_off).to eq true
      end
  end
