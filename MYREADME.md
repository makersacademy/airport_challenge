--Tenth commit

The take_off method can be called without an argument. Can now choose a plane to take off next or, if empty, the first plane that landed takes off

--Nine commit

Planes cannot take off when the weather is stormy

--Eighth commit

Planes cannot land when the weather is stormy. Weather is sunny by default

--Seventh commit

Airports can be created with variable capacity. A plane cannot land when an extended airport is full

--Sixth commit

A plane cannot land when the airport is full (current capacity 2). Tested using doubles

--Fifth commit

  The airport object can now store plane objects when they land, and release them when they take off. Refactored tests

--Fourth commit

  Decided it was simpler to have the take_off and land methods be a part of Airport class, instead of Plane class

--Third commit

  Fixed error with the feature tests and tidied up, Planes can now take off and have flying status

--Second commit

  A plane has flying status when created

--First commit

  A plane can land at an airport

--Daryl Watson