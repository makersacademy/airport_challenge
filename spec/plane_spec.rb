require 'plane'

describe Plane do

  it { is_expected.to respond_to :land_request }

  it 'responds to land request' do
  subject.land_request
  expect(subject.land_request).to eq true
  end
end
