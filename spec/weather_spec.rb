require 'weather'
require 'plane'
require 'airport'



describe Weather do
subject(:weather) {described_class.new}

    it 'is stormy if chance occurs' do
      allow(subject).to receive(:chance).and_return(8)
    # subject.stub(:chance) {8}
    subject.weather
    expect(subject.stormy).to eq true
    end


end
