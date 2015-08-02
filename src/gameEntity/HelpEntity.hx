package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

/**
 * ...
 * @author Amidos
 */
class HelpEntity extends Entity
{

	public function new() 
	{
		super();
		
		x = HXP.halfWidth + 5;
		y = HXP.halfHeight + 10;
		
		var image:Image = new Image("graphics/help.png");
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = image.height / 2;
		
		graphic = image;
		layer = LayerConstants.gameObjects;
	}
	
}