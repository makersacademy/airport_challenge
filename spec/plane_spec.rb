require 'plane'

describe Plane do
  let(:plane) {double :plane, landed?: true}
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :landed  }

  it 'checks to see if a new plane has arrived' do
  	expect(subject.landed).to eq false
  end

  it 'checks to see if a random plane has landed' do
  	expect(subject.landed?).to eq false
  end
end
