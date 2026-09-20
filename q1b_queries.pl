% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the correct section below.
% You should not use helper predicates for these queries.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%
%
% 
% Add your solution queries in section q1_trip_queries below. The argument in the query
% should be the answer to question given in natural language. 
%
% To test your queries, first compile this file in ECLiPSe. Doing so will first
% load your KB, and then create a rule for each query. You can then test a query
% (for example query 5), by entering the following in interactive mode.
%
% > query5(D).
%
% Note that the value assigned to each variable in the body of each rule is not 
% printed out. For example, if you have the following rule
%
% query99(X) :- pred1(Y), pred2(X, Y), pred3(Z).
%
% then calling query(X) will only print out X if it succeeds. Thus, for debugging,
% it may be useful to test your queries directly as
%
% > pred1(Y), pred2(X, Y), pred3(Z).
%
% as doing so will print the values of all of X, Y, and Z. However, ensure that your
% final submission follows the required format, and works as expected.




%%%%% SECTION: q1b_kb_import
% The following line will import your KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q1a_trip_kb].





%%%%% SECTION: q1_day_helper
% This section has statements identifying all valid days in the month of October
% DO NOT ADD ANY CODE IN THIS SECTION AS IT WILL BE IGNORED BY OUR AUTOGRADER.
day(1).  day(2).  day(3).  day(4).  day(5).  day(6).  day(7).  day(8).  day(9).  day(10).
day(11).  day(12).  day(13).  day(14).  day(15).  day(16).  day(17).  day(18).  day(19).  day(20).
day(21).  day(22).  day(23).  day(24).  day(25).  day(26).  day(27).  day(28).  day(29).  day(30).
day(31).


%%%%% SECTION: q1_trip_queries
% Enter your solution queries below
% By default, all queries currently succeed without answering the question correctly.
% They do so using the Prolog keyword "true". Below, we are using this as a placeholder.
% This keyword is not helpful beyond this use case and you should NOT use it in this
% assignment or any other unless explicitly told to. You should similarly never use the
% "false" keyword.
% DO NOT CHANGE THE HEADS OF EACH RULE, as we will be testing your queries by calling the 
% head as defined. You will not get marks if you do.
% DO NOT INTRODUCE ANY HELPER PREDICATES FOR THIS QUESTION.

%%% QUERY 1: What is the price of the flight from Toronto to Quebec City on October 9?
% Use the constants toronto and quebec_city.
query1(Price) :- flight(toronto, quebec_city, 9, Price).


%%% QUERY 2: Does the Sheraton in Halifax have availability on October 4?
% Use the constants the_sheraton and halifax to refer to the corresponding entities in the query.
% NOTICE that this rule has no arguments since it is a true or false question.
query2 :- true.


%%% QUERY 3: Find an attraction in Calgary that has tickets available for it on October 18.
% Use the constant calgary to refer to the corresponding entity in the query.
query3(Event) :- true.


%%% QUERY 4: On what date can you get opera tickets in Vancouver for less than $75?
% Use the constants vancouver and opera to refer to the corresponding entities in the query.
query4(Date) :- true.


%%% QUERY 5: What is the total cost of staying at the Hilton in Saskatoon on October 17, 18, and 19?
% Use the constants the_hilton and saskatoon to refer to the corresponding entities in the query.
query5(Cost) :- true.


%%% QUERY 6: Find a city other than Victoria and Banff, that you can fly to from Vancouver on October 27 for less than $300.
% Use the constants victoria, banff, and vancouver to refer to the corresponding entities in the query.
query6(City) :- true.


%%% QUERY 7: Find a city I can fly to and back from Montreal, for a total of no more than \$500, for a 3 night stay sometime from October 20 to 31 (inclusive).
% Notice the query arguments will show both the city visited, and the starting date of the vacation (ie. the day the flight leaves Montreal).
query7(City, StartDate) :- true.


%%% QUERY 8: Find a city that has more than 1 hotel with availability on October 27.
% Notice the query arguments will show the two hotels in question (the order does not matter).
query8(City, Hotel1, Hotel2) :- true.


%%% QUERY 9: Find a day in October that the Holiday Inn in Toronto does not have an available room.
% Use the constants holiday_inn and toronto to refer to the corresponding entities in the query.
query9(Date) :- true.


%%% QUERY 10: Is there an attraction in Vancouver that has tickets available for any 3 consecutive days in October?
% Use the constant vancouver to refer to the corresponding entities in the query.
% Notice the query arguments will show the first of the three consecutive dates.
query10(Name, Day1) :- true.


%%% QUERY 11: What is the most expensive attraction that has tickets available for it in Montreal on October 19
% For this query, use the constant montreal to refer to the corresponding entities in the query.
query11(Name) :- true.


%%% QUERY 12: Find the cheapest 2 night vacation that does a round trip from Toronto, has a hotel on both
%%% nights, includes an attraction, and is sometime between October 10 and 20 (inclusive).
% For this query, use the constant toronto to refer to the corresponding entities in the query.
% Note that the arguments in the query will find the start date of the trip, the city being visited,
% the hotel to be stayed at, the attraction to attend, and the trip price.
query12(StartDate, City, Hotel, Attraction, Cost) :- true.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
