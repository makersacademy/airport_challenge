require 'weather'
require 'airport'

describe Weather do 

  it { is_expected.to respond_to(:current_conditions) } 
  
end
