require 'airport'
require 'plane'

describe Airport do 
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to :status }

  describe '#landing' do
      it 'prevents planes from landing because of full airport capacity' do
        allow(plane).to receive(:landed?) {true}
        Airport::DEFAULT_CAPACITY.times { subject.landing plane  }
        expect{ subject.landing plane }.to raise_error("sorry, the airport is FULL")
      end

      it "stores landed planes" do
        allow(plane).to receive(:landed?) {false}
        expect(subject.landing plane).to eq "the plane doesnt have the permission to land!"
      end
  end

  describe '#taking_off' do
    
  end

end