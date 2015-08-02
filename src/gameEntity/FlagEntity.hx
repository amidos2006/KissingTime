package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Image;
import Global.SexualOrientation;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Amidos
 */
class FlagEntity extends Entity
{
	private var backdrop:Backdrop;
	private var scrollingSpeed:Float;
	
	public function new() 
	{
		super();
		
		scrollingSpeed = 2;
		
		var fileName:String = "homoBack.png";
		if (Global.sexualOrientation == SexualOrientation.hetrosexual)
		{
			fileName = "hetroBack.png";
		}
		if (Global.sexualOrientation == SexualOrientation.bisexual)
		{
			fileName = "biBack.png";
		}
		
		backdrop = new Backdrop("graphics/" + fileName);
		backdrop.y = Global.scrollPosition + scrollingSpeed;
		
		graphic = backdrop;
		layer = LayerConstants.background;
	}
	
	override public function update():Void 
	{
		backdrop.y += scrollingSpeed;
		Global.scrollPosition = backdrop.y;
		
		super.update();
	}
}