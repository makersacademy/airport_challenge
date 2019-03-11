<!-- 
                      __  __       _
                     |  \/  |     | |
          /L|0\      | \  / | __ _| | _____ _ __ ___
         /  |  \     | |\/| |/ _` | |/ / _ \ '__/ __|
        /       \    | |  | | (_| |   <  __/ |  \__ \
       /    |    \   |_|  |_|\__,_|_|\_\___|_|  |___/
      /           \
     /  __  | __   \         /\   (_)                     | |
    /  __/    \__   \       /  \   _ _ __ _ __   ___  _ __| |_
   /  /__   |  __\   \     / /\ \ | | '__| '_ \ / _ \| '__| __|
  /___________________\   / ____ \| | |  | |_) | (_) | |  | |_
 /           **|**         \ /_/    \_\_|_|  | .__/ \___/|_|   \__|
        **/   _|_   \**                      | |
/      **____/___\____**     \               | |
___________**[o0o]**___________              |_|
         _____ _           _ _
        / ____| |         | | |
       | |    | |__   __ _| | | ___ _ __   __ _  ___
       | |    | '_ \ / _` | | |/ _ \ '_ \ / _` |/ _ \
       | |____| | | | (_| | | |  __/ | | | (_| |  __/
        \_____|_| |_|\__,_|_|_|\___|_| |_|\__, |\___|
                                           __/ |
                                          |___/ -->

Logo made using [ASCII Text Signature Generator](https://www.kammerl.de/ascii/AsciiSignature.php)

### The Task

**The version here was a code along with [Sam Morgan](https://github.com/sjmog) in an attempt to get to grips with rspec. This is not my work.
Video is available [https://www.youtube.com/watch?v=Vg0cFVLH_EM&t=577s](here)**


We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
