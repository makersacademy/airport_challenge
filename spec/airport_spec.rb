require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it { expect(airport).to respond_to :planes }
  
end
