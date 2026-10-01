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
% Add the required KB statements in the section below.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below


%%%%% SECTION: q1_kb
%%%%% You should put the atomic statements for your KB below

% flight(City1, City2, Date, Price)
flight(toronto, quebec_city, 9, 180).
flight(quebec_city, toronto, 11, 120).
flight(toronto, montreal, 10, 150).
flight(montreal, toronto, 12, 160).
flight(toronto, ottawa, 12, 100).
flight(ottawa, toronto, 14, 110).
flight(toronto, montreal, 15, 200).
flight(montreal, quebec_city, 17, 150).
flight(montreal, toronto, 17, 210).
flight(quebec_city, montreal, 18, 100).
flight(quebec_city, toronto, 20, 250).
flight(montreal, toronto, 20, 190).
flight(toronto, halifax, 19, 90).
flight(halifax, toronto, 21, 95).
flight(montreal, ottawa, 18, 80).
flight(ottawa, montreal, 21, 85).
flight(montreal, halifax, 21, 200).
flight(halifax, montreal, 24, 220).
flight(montreal, vancouver, 22, 400).
flight(vancouver, montreal, 25, 350).
flight(montreal, calgary, 23, 260).
flight(calgary, montreal, 27, 240).
flight(montreal, toronto, 28, 150).
flight(toronto, montreal, 31, 200).
flight(vancouver, victoria, 27, 120).
flight(vancouver, banff, 27, 200).
flight(vancouver, calgary, 27, 250).
flight(vancouver, edmonton, 27, 220).
flight(vancouver, toronto, 27, 450).

% hasRoom(Name, City, Date, Price)
hasRoom(the_sheraton, halifax, 4, 210).
hasRoom(the_sheraton, halifax, 5, 215).
hasRoom(the_sheraton, halifax, 19, 160).
hasRoom(the_sheraton, halifax, 20, 160).
hasRoom(the_hilton, saskatoon, 17, 150).
hasRoom(the_hilton, saskatoon, 18, 160).
hasRoom(the_hilton, saskatoon, 19, 170).
hasRoom(the_hilton, saskatoon, 20, 175).
hasRoom(the_hilton, toronto, 2, 200).
hasRoom(the_hilton, toronto, 3, 200).
hasRoom(the_hilton, toronto, 4, 200).
hasRoom(the_hilton, toronto, 5, 250).
hasRoom(the_hilton, toronto, 6, 250).
hasRoom(the_hilton, toronto, 7, 250).
hasRoom(holiday_inn, toronto, 1, 120).
hasRoom(holiday_inn, toronto, 2, 120).
hasRoom(holiday_inn, toronto, 3, 120).
hasRoom(holiday_inn, toronto, 4, 120).
hasRoom(holiday_inn, toronto, 5, 120).
hasRoom(holiday_inn, toronto, 6, 120).
hasRoom(holiday_inn, toronto, 8, 130).
hasRoom(the_ritz, montreal, 10, 180).
hasRoom(the_ritz, montreal, 11, 180).
hasRoom(the_ritz, montreal, 15, 195).
hasRoom(the_ritz, montreal, 16, 195).
hasRoom(the_ritz, montreal, 18, 200).
hasRoom(the_ritz, montreal, 19, 200).
hasRoom(the_queen_elizabeth, montreal, 16, 150).
hasRoom(the_chateau_frontenac, quebec_city, 9, 110).
hasRoom(the_chateau_frontenac, quebec_city, 10, 110).
hasRoom(the_chateau_frontenac, quebec_city, 17, 125).
hasRoom(the_chateau_frontenac, quebec_city, 18, 125).
hasRoom(the_chateau_frontenac, quebec_city, 19, 125).
hasRoom(the_chateau_laurier, ottawa, 12, 250).
hasRoom(the_chateau_laurier, ottawa, 13, 260).
hasRoom(the_lord_elgin, ottawa, 12, 90).
hasRoom(the_fairmont, vancouver, 27, 300).
hasRoom(the_westin, vancouver, 27, 250).
hasRoom(the_delta, calgary, 27, 180).

% ticket(Name, City, Date, Price)
ticket(calgary_tower, calgary, 18, 25).
ticket(heritage_park, calgary, 18, 30).
ticket(calgary_tower, calgary, 19, 25).
ticket(opera, vancouver, 8, 90).
ticket(opera, vancouver, 15, 70).
ticket(opera, vancouver, 22, 60).
ticket(opera, toronto, 15, 50).
ticket(capilano_bridge, vancouver, 10, 60).
ticket(capilano_bridge, vancouver, 11, 60).
ticket(capilano_bridge, vancouver, 12, 65).
ticket(capilano_bridge, vancouver, 13, 65).
ticket(aquarium, vancouver, 20, 40).
ticket(aquarium, vancouver, 21, 40).
ticket(aquarium, vancouver, 23, 40).
ticket(notre_dame_basilica, montreal, 19, 15).
ticket(canadiens_game, montreal, 19, 120).
ticket(biodome, montreal, 19, 25).
ticket(biodome, montreal, 11, 25).
ticket(old_montreal_tour, montreal, 11, 40).
ticket(biodome, montreal, 16, 25).
ticket(war_museum, ottawa, 13, 20).
ticket(pier_21, halifax, 20, 15).
ticket(citadelle, quebec_city, 10, 20).


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
