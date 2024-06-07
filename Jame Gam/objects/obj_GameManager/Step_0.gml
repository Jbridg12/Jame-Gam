/// @description Insert description here
// You can write your code in this editor


loopElapsedTime += delta_time/1000000;
netElapsedTime += delta_time/1000000;

if(remainingLives <= 0)
{
	// Game Over
	room_goto(MainMenu);	
}

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
			temper : baseHitTimer + (weightedHitTimer * random_range(0, 1)),
			hasHit : false,
			isHitting : false,
		};
		
		array_insert(seatList, _seat, _newPlayer);
		

	}
	
	for(var _i = 0; _i < array_length(seatList); _i++)
	{
		var _player = seatList[_i];
		
		if(isHitting)
		{
			if(--temper <= 0)
			{
				//Lose Health and Leave
				remianingLives--;
				//tipScore -= 100;
				
				// Handle Player Leaving Seat
				array_push(emptySeats, _player.seat);
				array_delete(seatList, _i, 1);
			}
		}
		else if(_i.hasHit && random_range(0, 1) < p_fold)
		{
			// Handle Player Leaving Seat
			array_push(emptySeats, _player.seat);
			array_delete(seatList, _i, 1);
			with(obj_alert)
			{
				if(index == _player.seat)
				{
					active = true
					timer = 5;
					// Fold on
				}
			}
			
		}
		else if(random_range(0, 1) < p_hit)
		{
			with(obj_alert)
			{
				if(index == _player.seat)
				{
					active = true;
					// Hit on
				}
			}
			
			_player.isHitting = true;
			_player.hasHit = true;
		}
	}
	
	
}


// Input Detection

for(var _i = 0; _i < array_length(seatList); _i++)
{
	var _player = seatList[_i];
	
	if(keyboard_check(ord(_player.button))
	{
		with(obj_alert)
		{
			if(index == _player.seat)
			{
				active = false;
			}
		}
	}
}