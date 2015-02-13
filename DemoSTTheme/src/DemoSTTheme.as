package
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	import starling.core.Starling;

	[SWF(width = "768", height = "1024", frameRate = "30")]
	public class DemoSTTheme extends Sprite
	{
		public function DemoSTTheme()
		{
			var mStarling:Starling = new Starling(GameStage, stage, new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight));

			mStarling.start();
		}
	}
}
