package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import openfl.Assets;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Amidos
 */
class GameoverEntity extends Entity
{

	public function new() 
	{
		super();
		
		y = -10;
		
		var image:Image = new Image("graphics/gameover.png");
		image.smooth = false;
		
		var text:Text = new Text("score: " + Math.ceil(Global.score));
		text.font = Assets.getFont("fonts/nokiafc22.ttf").fontName;
		text.smooth = false;
		text.size = 8;
		text.align = TextFormatAlign.CENTER;
		text.originX = -HXP.halfWidth + text.width / 2;
		text.originY = -48 + text.height / 2;
		
		graphic = new Graphiclist([image, text]);
		layer = LayerConstants.hud;
	}
	
}