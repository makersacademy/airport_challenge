require 'weather'
describe Weather do 
    it { is_expected.to respond_to :stormy? }
    it 'can be reported stormy' do
      subject.storm
      expect(subject).to be_stormy
    end
end
