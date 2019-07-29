require 'plane'
describe Plane do
  it { is_expected.to respond_to :departed }
  
  it 'confirms if plane is departed' do
  allow(subject).to receive(:departed).and_return true
  end
end