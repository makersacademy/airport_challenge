require 'plane'

describe Plane do

  it 'can be flying' do
    subject.set_flying
    expect(subject.flying).to eq true
  end

end
