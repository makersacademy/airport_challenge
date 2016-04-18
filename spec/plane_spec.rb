require 'plane'
describe Plane do
  it {is_expected.to respond_to :landed?}
  it {is_expected.to respond_to :took_off?}
  it 'is expected to confirm its presence when landed' do
  
   expect(subject.landed?).to be true
 end
  it 'is expected to confirm its no presence when it has taken off' do
    expect(subject.took_off?).to be false
  end
end
