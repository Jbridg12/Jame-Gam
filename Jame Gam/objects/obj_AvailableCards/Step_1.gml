/// @description Insert description here
// You can write your code in this editor

if(availableCards <= 0)
{
	with(obj_GameManager)
	{
		if(!shufflePrompt)
		{
			shufflePrompt = true;	
			layer_sequence_create("Instances", 778, 450, ShufflePrompt);
		}
	}
	
}
