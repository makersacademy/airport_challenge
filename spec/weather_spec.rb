require 'weather'
require 'plane'
require 'airport'



describe Weather do
subject(:weather) {described_class.new}

    it 'is stormy if chance occurs' do
    subject.stub(:chance) {8}
    subject.weather
    expect(subject.stormy).to eq true
    end


end
