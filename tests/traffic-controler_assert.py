# lib/traffic-controller_assert.py

import pytest

def traffic_controller():
    raise ValueError("Exception raised: no flies expected")

def test_traffic_controller():
    with pytest.raises(ValueError):
        traffic_controller()
