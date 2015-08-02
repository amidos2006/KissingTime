package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.BitmapText;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import openfl.Assets;

/**
 * ...
 * @author Amidos
 */
class ScoreEntity extends Entity
{
	private var text:Text;
	private var backText:Text;
	
	private var maxScale:Float;
	private var minScale:Float;
	private var scaleSpeed:Float;
	
	public function new() 
	{
		super();
		
		x = HXP.halfWidth;
		y = HXP.height - 12;
		
		minScale = 1;
		maxScale = 2;
		scaleSpeed = -0.05;
		
		backText = new Text("" + Math.ceil(Global.score));
		backText.smooth = false;
		backText.font = Assets.getFont("fonts/nokiafc22.ttf").fontName;
		backText.size = 17;
		backText.color = 0xFF000000;
		backText.originX = backText.width / 2;
		backText.originY = backText.height / 2;
		
		text = new Text("" + Math.ceil(Global.score));
		text.smooth = false;
		text.font = Assets.getFont("fonts/nokiafc22.ttf").fontName;
		text.size = 16;
		text.originX = text.width / 2;
		text.originY = text.height / 2;
		
		graphic = new Graphiclist([backText, text]);
		layer = LayerConstants.hud;
	}
	
	public function UpdateScore():Void
	{
		text.text = "" + Math.ceil(Global.score);
		text.originX = text.width / 2;
		text.originY = text.height / 2;
		text.scale = maxScale;
		
		backText.text = "" + Math.ceil(Global.score);
		backText.originX = backText.width / 2;
		backText.originY = backText.height / 2;
		backText.scale = maxScale;
	}
	
	override public function update():Void 
	{
		super.update();
		
		text.scale += scaleSpeed;
		if (text.scale < minScale)
		{
			text.scale = minScale;
		}
		backText.scale = text.scale;
	}
}