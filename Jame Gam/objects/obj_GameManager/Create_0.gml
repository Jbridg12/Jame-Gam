/// @description Insert description here
// You can write your code in this editor


loopElapsedTime = 0;
netElapsedTime = 0;


// Table Parameters
maxSeats = 5;
seatList = array_create(maxSeats);
emptySeats = array_create_ext(maxSeats, seat_init(index));
instance


// Probabilities
pNewPlayer = 0.1;
pHit = 0.5;
pFold = 0.5;