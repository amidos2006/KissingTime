package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.tweens.misc.VarTween;
import openfl.Assets;
import openfl.geom.Rectangle;

class Characters
{
	public static var male:Int = 1;
	public static var female:Int = 0;
	public static var animal:Int = 2;
	
	public static function GetRandomCharacter():Int
	{
		if (HXP.random < 0.9)
		{
			if (HXP.random < 0.5)
			{
				return male;
			}
			return female;
		}
		
		return animal;
	}
}

/**
 * ...
 * @author Amidos
 */
class CharactersEntity extends Entity
{
	public var characterID:Int;
	public var characterFaceID:Int;
	public var alive:Bool;
	
	private var image:Image;
	
	private var maxScale:Float;
	private var minScale:Float;
	private var scaleSpeed:Float;
	
	private var minAngle:Float;
	private var maxAngle:Float;
	private var rotationSpeed:Float;
	
	private var scaleTween:VarTween;
	
	public function new(oldID) 
	{
		super();
		
		minScale = 1.7;
		maxScale = 2.3;
		scaleSpeed = 0.025;
		
		minAngle = -30;
		maxAngle = 30;
		rotationSpeed = 2.5;
		
		x = HXP.halfWidth;
		y = HXP.halfHeight;
		
		characterID = Characters.GetRandomCharacter();
		characterFaceID = (oldID + HXP.rand(3) + 1) % 4;
		alive = true;
		
		image = new Image("graphics/characters.png", new Rectangle(characterFaceID * 32, characterID * 32, 32, 32));
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = image.height / 2;
		image.scale = 2;
		image.angle = Math.random() * 60 - 30;
		
		graphic = image;
		layer = LayerConstants.gameObjects;
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