% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Natnael Michael
%%%%% STUDENT ID: 500982899
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the sectopms section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY
% the already included comment lines below
%


%%%%% SECTION: q3_kb_import
% The following line will import your KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q1a_trip_kb].



%%%%% SECTION: q3_day_helper
% This section has statements identifying all valid days in the month of October
% DO NOT ADD ANY CODE IN THIS SECTION AS IT WILL BE IGNORED BY OUR AUTOGRADER.
day(1).  day(2).  day(3).  day(4).  day(5).  day(6).  day(7).  day(8).  day(9).  day(10).
day(11).  day(12).  day(13).  day(14).  day(15).  day(16).  day(17).  day(18).  day(19).  day(20).
day(21).  day(22).  day(23).  day(24).  day(25).  day(26).  day(27).  day(28).  day(29).  day(30).
day(31).



%%%%% SECTION: q3a_stay_cost
% NOTE: When testing your stayCost program, we will only use the code in this section,
% the KB code (our own test KBs, that is), and the code in q3_day_helper. All other code
% in this file will be ignored. Thus, any helpers for stayCost must be included here.

% stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost): Cost is the total
% cost of the nights from CheckinDate up to (but not including) CheckoutDate,
% spent in one hotel in City that has a room on every one of those nights.
% It fails if CheckinDate is not before CheckoutDate, or if no single hotel
% has a room on all of the required nights.
stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    CheckinDate < CheckoutDate,
    stayCostNights(Hotel, City, CheckinDate, CheckoutDate, Cost).

% Helper: recursively sums the cost of the night starting at CheckinDate and
% the remaining nights up to CheckoutDate.
stayCostNights(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    NextDate is CheckinDate + 1,
    NextDate = CheckoutDate,
    hasRoom(Hotel, City, CheckinDate, Cost).

stayCostNights(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    NextDate is CheckinDate + 1,
    NextDate < CheckoutDate,
    hasRoom(Hotel, City, CheckinDate, NightCost),
    stayCostNights(Hotel, City, NextDate, CheckoutDate, RemainingCost),
    Cost is NightCost + RemainingCost.




%%%%% SECTION: q3b_round_trip
% NOTE: When testing your roundTrip program, we will only use the code in this section,
% the KB code (our own test KBs, that is), the code in q3_day_helper, and the code in
% q3a_stay_cost (ie. you may use the program in Q3a as a helper). Any other code needed
% by roundTrip must be included here.

% roundTrip(City, Start, End, NumFlights, Cost): there is a legal round trip
% of exactly NumFlights flights that leaves City on day Start and returns to
% City on day End. Hotels are required on every night from Start up to (but
% not including) End, one hotel per stay, and may change only when the trip
% moves to another city. Cost is the total of all flights and hotels.
roundTrip(City, Start, End, NumFlights, Cost) :-
    NumFlights >= 2,
    Start < End,
    trip(City, City, Start, End, NumFlights, Cost).

% Helper: trip(Origin, From, DepartureDate, End, NumFlights, Cost) holds when,
% being in city From with the next flight departing on DepartureDate, there is
% a legal continuation of exactly NumFlights flights that eventually lands
% back in Origin on day End, for total flight-and-hotel cost Cost.
trip(Origin, From, DepartureDate, End, NumFlights, Cost) :-
    NumFlights = 1,
    DepartureDate = End,
    flight(From, Origin, End, Cost).

trip(Origin, From, DepartureDate, End, NumFlights, Cost) :-
    NumFlights > 1,
    flight(From, NextCity, DepartureDate, FlightCost),
    day(NextDate),
    NextDate > DepartureDate,
    NextDate =< End,
    stayCost(_, NextCity, DepartureDate, NextDate, StayCost),
    RemainingFlights is NumFlights - 1,
    trip(Origin, NextCity, NextDate, End, RemainingFlights, RestCost),
    Cost is FlightCost + StayCost + RestCost.





%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
