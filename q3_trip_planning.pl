% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Taarush Jain
%%%%% STUDENT ID: 501010905
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

% Base case: checking out the day after checking in is a single night at the hotel.
stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    CheckoutDate is CheckinDate + 1,
    hasRoom(Hotel, City, CheckinDate, Cost).
% Recursive case: pay for the first night, then stay at the same hotel from the next day.
stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    NextDate is CheckinDate + 1, NextDate < CheckoutDate,
    hasRoom(Hotel, City, CheckinDate, NightCost),
    stayCost(Hotel, City, NextDate, CheckoutDate, RestCost),
    Cost is NightCost + RestCost.



%%%%% SECTION: q3b_round_trip
% NOTE: When testing your roundTrip program, we will only use the code in this section,
% the KB code (our own test KBs, that is), the code in q3_day_helper, and the code in
% q3a_stay_cost (ie. you may use the program in Q3a as a helper). Any other code needed
% by roundTrip must be included here.

roundTrip(City, Start, End, NumFlights, Cost) :-
    NumFlights >= 2,
    flightSequence(City, Start, City, End, NumFlights, Cost).

% flightSequence(From, Start, To, End, NumFlights, Cost): there is a legal sequence of
% exactly NumFlights flights that leaves From on day Start and whose last flight arrives
% in To on day End. Cost includes all flights plus a single hotel for every night spent
% in each city between consecutive flights.
flightSequence(From, Start, To, Start, 1, Cost) :-
    flight(From, To, Start, Cost).
flightSequence(From, Start, To, End, NumFlights, Cost) :-
    NumFlights > 1,
    flight(From, Stop, Start, FlightCost),
    day(NextFlightDate), Start < NextFlightDate, NextFlightDate =< End,
    stayCost(_, Stop, Start, NextFlightDate, HotelCost),
    RemainingFlights is NumFlights - 1,
    flightSequence(Stop, NextFlightDate, To, End, RemainingFlights, RestCost),
    Cost is FlightCost + HotelCost + RestCost.

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
