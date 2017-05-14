require 'plane'

describe Plane do
  
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :landed  }

  it 'checks to see if a new plane has arrived' do
  	expect(subject.landed).to eq true
  end
end
