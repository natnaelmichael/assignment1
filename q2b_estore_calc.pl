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
% Add the required statements in the q2_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_kb_import
% The following line will import your estore KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q2a_estore_kb].


%%%%% SECTION: q2_rules
%%%%% You should put your rules in this section, including helper predicates.

% subtotal(Sub): total cost of all products purchased, before shipping and tax.
subtotal(Sub) :-
    cost(laptop, LaptopCost), numPurchased(laptop, LaptopCount),
    cost(monitor, MonitorCost), numPurchased(monitor, MonitorCount),
    cost(keyboard, KeyboardCost), numPurchased(keyboard, KeyboardCount),
    Sub is LaptopCost * LaptopCount + MonitorCost * MonitorCount + KeyboardCost * KeyboardCount.

% regularShipping(Ship): cost of shipping every purchased unit with standard shipping,
% ignoring any free shipping discount.
regularShipping(Ship) :-
    shippingCost(laptop, LaptopShip), numPurchased(laptop, LaptopCount),
    shippingCost(monitor, MonitorShip), numPurchased(monitor, MonitorCount),
    shippingCost(keyboard, KeyboardShip), numPurchased(keyboard, KeyboardCount),
    Ship is LaptopShip * LaptopCount + MonitorShip * MonitorCount + KeyboardShip * KeyboardCount.

% shippingCharge(ShippingType, Charge): what the customer pays for shipping, taking
% into account whether the subtotal earns free shipping for that shipping type.
shippingCharge(regular, 0) :-
    subtotal(Sub), freeRegularShippingMin(Min), Sub >= Min.
shippingCharge(regular, Charge) :-
    subtotal(Sub), freeRegularShippingMin(Min), Sub < Min,
    regularShipping(Charge).
shippingCharge(express, 0) :-
    subtotal(Sub), freeExpressShippingMin(Min), Sub >= Min.
shippingCharge(express, Charge) :-
    subtotal(Sub), freeExpressShippingMin(Min), Sub < Min,
    regularShipping(Ship), expressShippingRate(Rate),
    Charge is Ship + Ship * Rate.

% costWithShipping(ShippingType, Cost): pre-tax cost of the order including shipping.
costWithShipping(ShippingType, Cost) :-
    subtotal(Sub), shippingCharge(ShippingType, Charge),
    Cost is Sub + Charge.

% totalCost(ShippingType, Cost): cost of the order including shipping and tax.
totalCost(ShippingType, Cost) :-
    costWithShipping(ShippingType, PreTax), taxRate(Rate),
    Cost is PreTax + PreTax * Rate.

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW