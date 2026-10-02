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

% subtotal(Subtotal): pre-tax, pre-shipping cost of the whole order,
% i.e. the sum of (unit cost * number purchased) over the three products.
subtotal(Subtotal) :-
    cost(laptop, LaptopCost),
    numPurchased(laptop, LaptopCount),
    cost(monitor, MonitorCost),
    numPurchased(monitor, MonitorCount),
    cost(keyboard, KeyboardCost),
    numPurchased(keyboard, KeyboardCount),
    Subtotal is LaptopCost * LaptopCount
              + MonitorCost * MonitorCount
              + KeyboardCost * KeyboardCount.

% Helper: the standard (regular) shipping cost of the whole order before
% any free-shipping waiver is applied. This is the "regular shipping cost
% of the given order" to which the express shipping rate is applied.
regularShippingCost(Shipping) :-
    shippingCost(laptop, LaptopShip),
    numPurchased(laptop, LaptopCount),
    shippingCost(monitor, MonitorShip),
    numPurchased(monitor, MonitorCount),
    shippingCost(keyboard, KeyboardShip),
    numPurchased(keyboard, KeyboardCount),
    Shipping is LaptopShip * LaptopCount
             + MonitorShip * MonitorCount
             + KeyboardShip * KeyboardCount.

% Regular shipping: free once the pre-tax subtotal reaches the regular
% free-shipping minimum, otherwise the full standard shipping cost.
costWithShipping(regular, Cost) :-
    subtotal(Subtotal),
    freeRegularShippingMin(Min),
    Subtotal >= Min,
    Cost is Subtotal.

costWithShipping(regular, Cost) :-
    subtotal(Subtotal),
    freeRegularShippingMin(Min),
    Subtotal < Min,
    regularShippingCost(Shipping),
    Cost is Subtotal + Shipping.

% Express shipping: free once the pre-tax subtotal reaches the express
% free-shipping minimum, otherwise the standard shipping cost increased
% by the express shipping rate. The rate applies only to shipping.
costWithShipping(express, Cost) :-
    subtotal(Subtotal),
    freeExpressShippingMin(Min),
    Subtotal >= Min,
    Cost is Subtotal.

costWithShipping(express, Cost) :-
    subtotal(Subtotal),
    freeExpressShippingMin(Min),
    Subtotal < Min,
    regularShippingCost(Shipping),
    expressShippingRate(Rate),
    ExpressShipping is Shipping * (1 + Rate),
    Cost is Subtotal + ExpressShipping.

% totalCost(ShippingType, Cost): the pre-tax cost with the chosen shipping
% type, plus tax on the whole amount (products and shipping alike).
totalCost(ShippingType, Cost) :-
    costWithShipping(ShippingType, PreTax),
    taxRate(Rate),
    Cost is PreTax + PreTax * Rate.



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
