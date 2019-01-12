require 'weather'

RSpec.describe Weather do
it { is_expected.to respond_to :current_weather? }
end
