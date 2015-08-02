package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import openfl.Assets;
import openfl.geom.Rectangle;
import openfl.text.TextFormatAlign;
import Global.GenderIdentity;
import Global.SexualOrientation;

/**
 * ...
 * @author Amidos
 */
class DancingTextEntity extends Entity
{
	private var image:Image;
	private var alarmFunction:Void->Void;
	private var alarm:Alarm;
	
	private var maxScale:Float;
	private var minScale:Float;
	private var scaleSpeed:Float;
	
	private var minAngle:Float;
	private var maxAngle:Float;
	private var rotationSpeed:Float;
	
	public function new(input:String, time:Float, endFunction:Void->Void) 
	{
		super();
		
		var sfx:Sfx = new Sfx("sounds/" + input + ".wav");
		sfx.play();
		
		x = HXP.halfWidth;
		y = HXP.halfHeight;
		
		alarmFunction = endFunction;
		
		minScale = 0.7;
		maxScale = 1.3;
		scaleSpeed = 0.025;
		
		minAngle = -30;
		maxAngle = 30;
		rotationSpeed = 2.5;
		
		var yOff:Int = 0;
		if (input == GenderIdentity.female)
		{
			yOff = 20;
		}
		if (input == SexualOrientation.hetrosexual)
		{
			yOff = 40;
		}
		if (input == SexualOrientation.homosexual)
		{
			yOff = 60;
		}
		if (input == SexualOrientation.bisexual)
		{
			yOff = 80;
		}
		
		image = new Image("graphics/names.png", new Rectangle(0, yOff, 200, 20));
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = image.height / 2;
		
		alarm = new Alarm(time, AlarmEnds, TweenType.OneShot);
		
		graphic = image;
		layer = LayerConstants.gameObjects;
	}
	
	override public function added():Void 
	{
		super.added();
		
		addTween(alarm, true);
	}
	
	private function AlarmEnds(e:Dynamic):Void
	{
		if (alarmFunction != null)
		{
			alarmFunction();
		}
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