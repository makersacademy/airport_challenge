require 'weather'

RSpec.describe Weather do
  it { should respond_to :forecast }
end
