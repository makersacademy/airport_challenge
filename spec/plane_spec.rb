require 'plane'

describe Plane do
  it 'responds to #report_landed' do
    expect(subject).to respond_to(:report_landed)
  end
end
