// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_player( _seat ){

	var _player;
	var _sprite;
	var _key = string("{0}", _seat + 1);
	var _keyIndex;
	var _taken = false;
	// Do Temper/Patience first
			
	var _temper = random_range(0, 1);
	var _patience = baseHitTimer + (weightedHitTimer * _temper);
	
	
	if(global.difficulty > 8)
	{
		do
		{
			_taken = false;
			_keyIndex = irandom_range(0, array_length(global.allKeys) -1);
			_key = global.allKeys[_keyIndex];
		
			for(var _i = 0; _i < array_length(obj_GameManager.seatList); _i++)
			{
				if(obj_GameManager.seatList[_i] == 0) continue;
			
				if(obj_GameManager.seatList[_i].button == _key) _taken = true;
			}
		}
		until(!_taken)
		
		array_delete(global.hardKeys, _keyIndex, 1);
		
	}
	else if(global.difficulty > 6)
	{
		do
		{
			_taken = false;
			_keyIndex = irandom_range(0, array_length(global.hardKeys) -1);
			_key = global.hardKeys[_keyIndex];
		
			for(var _i = 0; _i < array_length(obj_GameManager.seatList); _i++)
			{
				if(obj_GameManager.seatList[_i] == 0) continue;
			
				if(obj_GameManager.seatList[_i].button == _key) _taken = true;
			}
		}
		until(!_taken)
		
		array_delete(global.hardKeys, _keyIndex, 1);
		
	}
	else if(global.difficulty > 4)
	{
		do
		{
			_taken = false;
			_keyIndex = irandom_range(0, array_length(global.ezKeys) -1);
			_key = global.ezKeys[_keyIndex];
		
			for(var _i = 0; _i < array_length(obj_GameManager.seatList); _i++)
			{
				if(obj_GameManager.seatList[_i] == 0) continue;
			
				if(obj_GameManager.seatList[_i].button == _key) _taken = true;
			}
		}
		until(!_taken)
		
		array_delete(global.ezKeys, _keyIndex, 1);
		
	}
	else if(global.difficulty > 2)
	{
		do
		{
			_taken = false;
			_keyIndex = irandom_range(0, array_length(global.ezestKeys) -1);
			_key = global.ezestKeys[_keyIndex];
		
			for(var _i = 0; _i < array_length(obj_GameManager.seatList); _i++)
			{
				if(obj_GameManager.seatList[_i] == 0) continue;
			
				if(obj_GameManager.seatList[_i].button == _key) _taken = true;
			}
		}
		until(!_taken)
		
		array_delete(global.ezestKeys, _keyIndex, 1);
		
	}
	
	if(random_range(0,1) <= 0.5)
	{
		_sprite = global.femaleHands[irandom(9)];
	}
	else
	{
		_sprite = global.maleHands[irandom(8)];
	}
	
	_player = {
		seat : _seat,
		sprite : _sprite,
		button : _key,
		basePatience : _patience,
		patienceTimer : _patience,
		temper : _temper,
		hits : 0,
		isHitting : false,
		isCooldown : false,
		hitCooldown : _patience - obj_GameManager.baseHitTimer,
		actionCooldown : obj_GameManager.actionCooldownBase / global.difficulty,
		createdDifficulty : global.difficulty
	};
	
	
	return _player;
}