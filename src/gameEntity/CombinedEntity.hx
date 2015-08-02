package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.HXP;
import Global.GenderIdentity;
import Global.SexualOrientation;
import openfl.Assets;

/**
 * ...
 * @author Amidos
 */
class CombinedEntity extends Entity
{
	private var flag:Backdrop;
	private var gender:Backdrop;
	
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
		
		flag = new Backdrop("graphics/" + fileName);
		flag.y = Global.scrollPosition + scrollingSpeed;
		
		fileName = "maleTrans.png";
		if (Global.genderIdentity == GenderIdentity.female)
		{
			fileName = "femaleTrans.png";
		}
		
		gender = new Backdrop("graphics/" + fileName);
		gender.y = -Global.scrollPosition - scrollingSpeed;
		
		var graphiclist:Graphiclist = new Graphiclist([flag, gender]);
		graphic = graphiclist;
		layer = LayerConstants.background;
	}
	
	override public function update():Void 
	{
		gender.y -= scrollingSpeed;
		flag.y += scrollingSpeed;
		
		super.update();
	}
}