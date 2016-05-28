require 'plane'

describe Plane do

  describe '::new' do
    it {should be_instance_of(Plane)}
    it {should initially be grounded}
  end

end