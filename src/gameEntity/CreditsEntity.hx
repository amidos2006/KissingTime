package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.BitmapText;
import com.haxepunk.HXP;

/**
 * ...
 * @author Amidos
 */
class CreditsEntity extends Entity
{

	public function new() 
	{
		super();
		
		x = 4;
		y = HXP.height - 12;
		
		var text:BitmapText = new BitmapText("Game by: Amidos\nMusic by: Nik Sudan");
		text.smooth = false;
		text.scale = 0.5;
		
		graphic = text;
		layer = LayerConstants.hud;
	}
	
}