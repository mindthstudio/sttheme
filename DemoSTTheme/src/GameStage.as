package
{
	import com.mindthstudio.theme.STTheme;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.PageIndicator;
	import feathers.controls.Panel;
	import feathers.controls.Screen;
	import feathers.controls.ScrollText;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	import feathers.layout.TiledColumnsLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.layout.VerticalLayout;
	
	import starling.core.Starling;
	import starling.events.Event;

	public class GameStage extends Screen
	{
		private var enableButton:Button;
		private var disableButton:Button;
		private var textInput:TextInput;
		private var textInput2:TextInput;
		private var textInput3:TextInput;
		private var panel:Panel;
		private var mLabel:Label;

		private var panel2:Panel;
		private var pageIndicator:PageIndicator;
		private var scrollText:ScrollText;
		
		private var toggle1:ToggleButton;
		private var tabbar:TabBar;
		
		private var panel3:Panel;

		public function GameStage()
		{
			super();

			new STTheme;

			addEventListener(Event.ADDED_TO_STAGE, whenInit);
		}

		private function whenInit(e:Event):void
		{
			var myLayout:TiledColumnsLayout = new TiledColumnsLayout;

			layout = myLayout;
			
			setSize(Starling.current.stage.stageWidth,Starling.current.stage.stageHeight);

			panel = new Panel;
			panel.layout = new VerticalLayout;
			panel.title = "Panel";

			addChild(panel);

			enableButton = new Button();
			enableButton.label = "enable";

			panel.addChild(enableButton);

			disableButton = new Button();
			disableButton.label = "disable";
			disableButton.isEnabled = false;

			panel.addChild(disableButton);

			textInput = new TextInput;

			textInput.prompt = "Username";
			textInput.setSize(250, 50);

			panel.addChild(textInput);

			textInput2 = new TextInput;

			textInput2.prompt = "Password";
			textInput2.setSize(250, 50);
			textInput2.displayAsPassword = true;

			panel.addChild(textInput2);

			textInput3 = new TextInput;

			textInput3.prompt = "Disable";
			textInput3.setSize(250, 50);
			textInput3.displayAsPassword = true;
			textInput3.isEnabled = false;

			panel.addChild(textInput3);

			pageIndicator = new PageIndicator;
			pageIndicator.pageCount = 5;

			panel.addChild(pageIndicator);

			mLabel = new Label;
			mLabel.text = "Label text";
			panel.addChild(mLabel);
			
			toggle1 = new ToggleButton;
			toggle1.label = "Toggle Button 1";
			panel.addChild(toggle1);
			
			tabbar = new TabBar;
			tabbar.dataProvider = new ListCollection([{'label':'A'},{'label':'B'},{'label':'C'}]);
			panel.addChild(tabbar);
			

			panel2 = new Panel;
			panel2.title = "ScollText";
			panel2.setSize(400, 400);
			panel2.layout = new VerticalLayout;

			addChild(panel2);

			scrollText = new ScrollText;
			scrollText.setSize(370, 300);
			scrollText.text = "STThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\nSTThemeSTThemeSTThemeSTThemeSTThemeSTThemeSTTheme\n";

			panel2.addChild(scrollText);
		}
		
		private function makeLabel(text:String):Label{
			var label:Label = new Label;
			
			label.text = text;
			
			return label;
		}
	}
}
