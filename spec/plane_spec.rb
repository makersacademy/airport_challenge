require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
#this test can be deleted in time
#remember need 100% coverage
#context on initialize?
  it {is_expected.to respond_to :status}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :land}
  it 'starts off in the air' do
    expect(subject.status).to eq(:flying)
  end

  it 'can land' do
    expect(subject.land).to eq(:landed)
  end

  it 'can take off' do
    #expect {subject.take_off}.to

  end




end
