package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.tweens.misc.Alarm;
import openfl.Assets;
import com.haxepunk.Tween.TweenType;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Amidos
 */
class SpaceEntity extends Entity
{
	private var image:Image;
	private var alarm:Alarm;
	
	public function new() 
	{
		super();
		
		x = HXP.halfWidth;
		y = HXP.height - 20;
		
		image = new Image("graphics/pressSpace.png");
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = image.height;
		
		alarm = new Alarm(20, Flicker, TweenType.Looping);
		
		graphic = image;
		layer = LayerConstants.hud;
	}
	
	override public function added():Void 
	{
		addTween(alarm, true);
		
		super.added();
	}
	
	private function Flicker(e:Dynamic):Void
	{
		image.alpha = 1 - image.alpha;
	}
}