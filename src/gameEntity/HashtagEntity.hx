package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import openfl.Assets;

/**
 * ...
 * @author Amidos
 */
class HashtagEntity extends Entity
{
	public function new() 
	{
		super();
		
		x = HXP.width - 4;
		y = HXP.height - 4;
		
		var spritemap:Spritemap = new Spritemap("graphics/hashtag.png", 52, 7);
		spritemap.smooth = false;
		spritemap.add("continous", [0, 1, 2, 3, 4, 5], 10);
		spritemap.play("continous");
		spritemap.originX = spritemap.width;
		spritemap.originY = spritemap.height;
		
		graphic = spritemap;
		layer = LayerConstants.hud;
	}	
}