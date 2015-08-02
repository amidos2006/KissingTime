package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import openfl.Assets;
import openfl.geom.Rectangle;
import Global.GenderIdentity;
import Global.SexualOrientation;

/**
 * ...
 * @author Amidos
 */
class LogoEntity extends Entity
{
	private var backdrop:Backdrop;
	
	private var scrollingSpeed:Float;
	
	public function new() 
	{
		super();
		
		scrollingSpeed = 2;
		
		var filename:String = "maleBack.png";
		if (Global.genderIdentity == GenderIdentity.female)
		{
			filename = "femaleBack.png";
		}
		
		backdrop = new Backdrop("graphics/" + filename);
		
		graphic = backdrop;
		layer = LayerConstants.background;
		
	}
	
	override public function update():Void 
	{
		backdrop.y += scrollingSpeed;
		
		super.update();
	}
}