require "./lib/weather"

describe Weather do
  it { is_expected.to respond_to (:sunny)  }
  it { is_expected.to respond_to (:cloudy) }
  it { is_expected.to respond_to (:stormy) }
  it { is_expected.to respond_to (:rainy)  }
  
end
