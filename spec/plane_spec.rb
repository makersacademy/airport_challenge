require 'plane.rb'
require 'rspec/expectations'

describe Plane do
   it { expect(subject).to respond_to :take_off}
   it { expect(subject).to respond_to :land}

  #{it ""}
end
