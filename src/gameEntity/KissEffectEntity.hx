package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

/**
 * ...
 * @author Amidos
 */
class KissEffectEntity extends Entity
{
	private var image:Image;
	private var alphaDecrease:Float;
	
	public function new() 
	{
		super();
		
		alphaDecrease = 0.0025;
		
		x = (HXP.random *  0.8 + 0.1) * HXP.width;
		y = (HXP.random *  0.8 + 0.1) * HXP.height;
		
		image = new Image("graphics/KissParticle.png");
		image.smooth = false;
		image.scale = 2 + HXP.random * 3;
		image.angle = HXP.random * 90 - 45;
		image.alpha = 0.7 + 0.3 * HXP.random;
		image.originX = image.width / 2;
		image.originY = image.height / 2;
		
		graphic = image;
		layer = LayerConstants.frontParticles;
	}
	
	override public function update():Void 
	{
		image.alpha -= alphaDecrease;
		if (image.alpha < 0)
		{
			scene.remove(this);
		}
		
		super.update();
	}
}