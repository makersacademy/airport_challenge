require 'airport'

RSpec.describe Airport do 

  it ' instruct an airplane to land at the airport ' do
      expect(subject.land).to be_instance_of(Airplane)
    end

end