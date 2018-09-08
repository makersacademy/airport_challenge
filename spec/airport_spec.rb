require './lib/airport'

describe Airport do
  describe '#takeoff_plane'
  it { should respond_to :takeoff_plane }
  describe '#land_plane'
  it { should respond_to :land_plane}

end
