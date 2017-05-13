require 'plane'

describe Plane do
  subject(:plane)  { described_class.new }

  it { expect(subject).to respond_to :suitable_for_flying? }
  it { expect(subject).to respond_to :landed? }
  it { expect(subject).to respond_to :taken_off? }


  

end
