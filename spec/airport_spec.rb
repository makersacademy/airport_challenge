require 'airport'
# Within the Airport class
describe Airport do
# Specifies the details of the Airport interface
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }
end
