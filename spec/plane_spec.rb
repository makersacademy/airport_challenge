require 'plane'

describe Plane do


  it { is_expected.to respond_to(:take_off)}

describe '#take_off' do
  context 'when plane is flying' do
   it 'raises an error' do
     error_message = 'Plane already flying!'

     expect { subject.take_off }.to raise_error error_message
   end
  end
  end

describe '#land' do
  context 'when plane lands' do
    it 'raises an error' do
      error_message = 'Plane is already landed!'

      # subject.land(airport)

      expect { subject.land }.to raise_error error_message
    end
  end
end

end
