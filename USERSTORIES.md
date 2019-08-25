Objects  | Messages
------------- | -------------
Plane | land;
Airport | receive_plane


1) instruct a plane to land at an airport

Objects  | Messages
------------- | -------------
Plane | land; take_off;
Airport |receive_plane; release_plane;

2) instruct a plane to take off from an airport and confirm that it is no longer in the airport

Objects  | Messages
------------- | -------------
Plane | land; take_off;
Airport | receive_plane; release_plane;
Weather | conditions?

3) I want to prevent takeoff when weather is stormy
useful URL https://devblast.com/b/what-are-guard-clauses

Objects  | Messages
------------- | -------------
Plane | land; take_off;
Airport | receive_plane; release_plane;
Weather | conditions?

4) I want to prevent landing when weather is stormy
useful URL https://devblast.com/b/what-are-guard-clauses

Objects  | Messages
------------- | -------------
Plane | land; take_off;
Airport | receive_plane; release_plane;
Weather | conditions?

5) I want to prevent landing when the airport is full

6) I would like a default airport capacity that can be overridden as appropriate

Edgecases:

planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
