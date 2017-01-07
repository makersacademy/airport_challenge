require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }

  it 'responds to land request' do
  subject.land
  expect(subject.land).to eq true
  end

  it { is_expected.to respond_to :depart }

  it 'responds to depart request' do
  expect(subject.depart).to eq true
  end


end
