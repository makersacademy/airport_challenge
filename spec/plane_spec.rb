require 'plane'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}

  # describe '#land' do
  #   it 'lands self at an airport' do
  #     airport = double('airport')
  #     expect{subject.land(airport)}
  #   end
  # end

  describe '#take_off' do
    it 'confirms self is no longer at the airport' do
      expect {subject.take_off}.to output('Plane has left airport').to_stdout
    end
  end

end
