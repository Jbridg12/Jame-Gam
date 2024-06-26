// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hit(_player)
{
	var _posx = 0;
	var _posy = 0;
	var _inst = instance_create_layer(x, y, "Instances", obj_card);
	// Alert Logic
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			active = false;
		}
	}
	// Throw Card
	with(obj_AvailableCards)
	{
		availableCards--;	
	}
	
	with(obj_hand)
	{
		if(index == _player.seat)
		{
			_posx = x;
			_posy = y;
			_inst.destinationX = x;
			_inst.destinationY = y;
			event_user(0);
		}
	}
	
	// Start Cooldown (quickens with difficulty)
	_player.patienceTimer = _player.basePatience;
	_player.isCooldown = true;
	
	// Award tip
	//with(obj_tips) tips += 10 * global.difficulty * _player.temper;
	with(obj_tips) tips += 10 * global.difficulty;
	
}

function fold(_player)
{
	seatList[_player.seat] = 0;
	
	// Reallocate Keys
	if(_player.createdDifficulty > 8 )
	{
		array_push(global.allKeys, _player.button);
	}
	if(_player.createdDifficulty > 6 )
	{
		array_push(global.hardKeys, _player.button);
	}
	else if(_player.createdDifficulty > 4)
	{
		array_push(global.ezKeys, _player.button);
	}
	else if(_player.createdDifficulty > 2)
	{
		array_push(global.ezestKeys, _player.button);
	}

	with(obj_Key)
	{
		if (index == _player.seat)
		{
			active = false;
		}
		
	}
	// Clear Hands
	with(obj_hand)
	{
		if (index == _player.seat)
		{
			//active = false;
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	
	// Create Folded Hand
	with(obj_FoldedCards)
	{
		if (index == _player.seat)
		{
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
			button = _player.button;
			amount = _player.hits;
		}
	}
	
	// Clear Text
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			// Fold on
			active = true
			text = "Fold"
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Take cards into pile
}

function leave(_player)
{
	seatList[_player.seat] = 0;
	
	// Reallocate Keys
	if(_player.createdDifficulty > 8 )
	{
		array_push(global.allKeys, _player.button);
	}
	if(_player.createdDifficulty > 6 )
	{
		array_push(global.hardKeys, _player.button);
	}
	else if(_player.createdDifficulty > 4)
	{
		array_push(global.ezKeys, _player.button);
	}
	else if(_player.createdDifficulty > 2)
	{
		array_push(global.ezestKeys, _player.button);
	}
	
	
	with(obj_Key)
	{
		if (index == _player.seat)
		{
			active = false;
		}
		
	}
	// Clear Hands
	with(obj_hand)
	{
		if (index == _player.seat)
		{
			event_user(0);
			alarm[1] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Clear Text
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			// Fold on
			active = true
			text = "I'm Out"
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	
	// Take cards into pile
	with(obj_CollectedCards)
	{
		collectedCards += _player.hits;
	}
	
}

function shuffle()
{
	var _collected = 0;
	
	with(obj_CollectedCards)
	{
		_collected = collectedCards;
		collectedCards = 0;
	}
	
	// Reset Card count
	with(obj_AvailableCards)
	{
		availableCards = _collected;	
	}
	
	with(obj_GameManager)
	{
		shufflePrompt = false;	
	}
	
	var _a = layer_get_all_elements("Instances");
	for (var _i = 0; _i < array_length(_a); _i++;)
	{
	    if layer_get_element_type(_a[_i]) == layerelementtype_sequence
	    {
	        layer_sequence_destroy(_a[_i]);
	    }
	}
}