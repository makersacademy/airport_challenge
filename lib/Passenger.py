import pytest

class Passenger:
    """I am a passenger"""

    def __init__(self, name, passport):
        self.name = name
        self.passport = passport

    @pytest.mark.attributes(name="Boris", passport=true)
    def Person(self):
        pass
