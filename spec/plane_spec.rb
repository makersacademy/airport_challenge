require 'plane'

describe Plane do

  describe 'responds to status'
  it {is_expected.to respond_to :status}

  describe 'it creates a new plane'
  it {is_expected.to respond_to subject.New}

end
