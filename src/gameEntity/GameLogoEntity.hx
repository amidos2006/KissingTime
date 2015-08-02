package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;

/**
 * ...
 * @author Amidos
 */
class GameLogoEntity extends Entity
{
	private var image:Image;
	
	private var maxScale:Float;
	private var minScale:Float;
	private var scaleSpeed:Float;
	
	private var minAngle:Float;
	private var maxAngle:Float;
	private var rotationSpeed:Float;
	
	public function new() 
	{
		super();
		
		minScale = 0.7;
		maxScale = 1.3;
		scaleSpeed = 0.025;
		
		minAngle = -30;
		maxAngle = 30;
		rotationSpeed = 2.5;
		
		x = HXP.halfWidth;
		y = HXP.halfHeight - 10;
		
		image = new Image("graphics/logo.png");
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = image.height / 2;
		
		graphic = image;
		layer = LayerConstants.hud;
	}
	
	override public function added():Void 
	{
		super.added();
		
		var kissingTime:Sfx = new Sfx("sounds/KissingTime.wav");
		kissingTime.play();
	}
	
	override public function update():Void 
	{
		if (image.scale >= maxScale || image.scale <= minScale)
		{
			scaleSpeed *= -1;
		}
		image.scale += scaleSpeed;
		
		if (image.angle >= maxAngle || image.angle <= minAngle)
		{
			rotationSpeed *= -1;
		}
		image.angle += rotationSpeed;
		
		super.update();
	}
}