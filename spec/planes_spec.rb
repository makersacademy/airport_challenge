require 'planes'

describe Planes do
  it 'plane is flying' do
    subject.flying
    expect(subject).to be_flying
  end
end
