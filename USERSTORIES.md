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
Weather | can_fly?

3) I want to prevent takeoff when weather is stormy]
useful URL https://devblast.com/b/what-are-guard-clauses
