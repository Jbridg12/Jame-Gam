/// @description Insert description here
// You can write your code in this editor


loopElapsedTime += delta_time/1000000;
netElapsedTime += delta_time/1000000;


//Perform Significant Difficulty Upgrades
if(netElapsedTime >= 300)
{
	//loop_elapsed_time = 0;
	
}


// Perform Basic Gameplay Loop
if(loopElapsedTime >= 1)
{
	loopElapsedTime = 0;
	
	if(random_range(0, 1) < p_new_player)
	{
		var _seatIndex = floor(random_range(0, array_length(emptySeats)));
		var _seat = emptySeats[_seatIndex];
		
		array_delete(emptySeats, _seatIndex, 1);
		
		// Construct new Player at table
		var _newPlayer = {
			seat : _seat,
			button : _seat + 1,
			temper : random_range(0, 1),
			hit : false,
		};
		
		array_insert(seatList, _seat, _newPlayer);
		

	}
	
	for(var _i = 0; _i < array_length(seatList); _i++)
	{
		var _player = seatList[_i];
		
		if(_i.hit && random_range(0, 1) < (p_fold * temper))
		{
			array_push(emptySeats, _player.seat);
			array_delete(seatList, _i, 1);
			
		}
		else if(random_range(0, 1) < (p_hit * temper))
		{
			
		}
	}
	
	
}