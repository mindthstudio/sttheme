package com.mindthstudio.theme
{
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import feathers.controls.Alert;
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.Panel;
	import feathers.controls.ProgressBar;
	import feathers.controls.ScrollBar;
	import feathers.controls.ScrollText;
	import feathers.controls.SpinnerList;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleButton;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import feathers.display.Scale9Image;
	import feathers.skins.FunctionStyleProvider;
	import feathers.textures.Scale9Textures;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**
	 * @author : mindth studio
	 */
	public class STTheme
	{
		// fonts ===========================================================================
		[Embed(source = "/../embeds/Quark-Bold.otf", mimeType = "application/x-font", fontName = "quark_b", advancedAntiAliasing = "true", embedAsCFF = "false", unicodeRange = "U+0020-007E")]
		private static const QUARK_B_CLASS:Class;
		public static const QUARK_B_FONT:String = "quark_b";

		[Embed(source = "/../embeds/Quark-Light.otf", mimeType = "application/x-font", fontName = "ubuntu-l", advancedAntiAliasing = "true", embedAsCFF = "false", unicodeRange = "U+0020-007E")]
		private static const QUARK_L_CLASS:Class;
		public static const QUARK_L_FONT:String = "quark_l";

		// assets ==========================================================================
		[Embed(source = "/../embeds/theme.png")]
		private static const THEME_ATLAS_PNG:Class;

		[Embed(source = "/../embeds/theme.xml", mimeType = "application/octet-stream")]
		private static const THEME_ATLAS_XML:Class;

		private static var _atlas:TextureAtlas;

		public function STTheme()
		{
			// set background
			Starling.current.stage.color = Starling.current.nativeStage.color = 0xecf0f1;

			// default
			FeathersControl.defaultTextRendererFactory = setTextRenderer;
			FeathersControl.defaultTextEditorFactory = setTextEditor;

			_atlas = new TextureAtlas(Texture.fromEmbeddedAsset(THEME_ATLAS_PNG), XML(new THEME_ATLAS_XML));
			// set style
			Header.globalStyleProvider = new FunctionStyleProvider(setHeader);
			Button.globalStyleProvider = new FunctionStyleProvider(setButton);
			ToggleButton.globalStyleProvider = new FunctionStyleProvider(setToggleButton);
			//ScrollBar.globalStyleProvider = new FunctionStyleProvider(setScrollbar);
			ScrollText.globalStyleProvider = new FunctionStyleProvider(setScrollText);
			TextInput.globalStyleProvider = new FunctionStyleProvider(setInputText);
			Label.globalStyleProvider = new FunctionStyleProvider(setLabel);
			TabBar.globalStyleProvider = new FunctionStyleProvider(setTabar);
			Panel.globalStyleProvider = new FunctionStyleProvider(setPanel);
			ProgressBar.globalStyleProvider = new FunctionStyleProvider(setProgressBar);
			PageIndicator.globalStyleProvider = new FunctionStyleProvider(setPageIndicator);
			Callout.globalStyleProvider = new FunctionStyleProvider(setCallout);

			// Todo here 
			// List.globalStyleProvider = new FunctionStyleProvider(setList);
			// SpinnerList.globalStyleProvider = new FunctionStyleProvider(setSpinnerList);
			// Alert.globalStyleProvider = new FunctionStyleProvider(setAlert);
		}

		// factory ================================================================

		private function setTextEditor(font:String, size:int, color:uint):TextFieldTextEditor
		{
			var _textFieldTextEditor:TextFieldTextEditor = new TextFieldTextEditor;

			_textFieldTextEditor.textFormat = new TextFormat(font, size, color);
			_textFieldTextEditor.isHTML = true;
			_textFieldTextEditor.embedFonts = true;

			return _textFieldTextEditor;
		}

		private function setTextRenderer(font:String, size:int, color:uint):TextFieldTextRenderer
		{
			var _textFieldTextRenderer:TextFieldTextRenderer = new TextFieldTextRenderer;

			_textFieldTextRenderer.textFormat = new TextFormat(font, size, color);
			_textFieldTextRenderer.isHTML = true;
			_textFieldTextRenderer.embedFonts = true;

			return _textFieldTextRenderer;
		}

		// style ===================================================================

		private function setHeader(header:Header):void
		{
			header.padding = 15;
			header.backgroundSkin = new Quad(1, 1, 0x2c3e50);
			header.titleFactory = function():TextFieldTextRenderer
			{
				return setTextRenderer(QUARK_B_FONT, 20, 0xffffff);
			}
		}

		private function setButton(button:Button):void
		{
			button.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-button.png"), new Rectangle(8, 8, 4, 8)));
			button.hoverSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("hover-button.png"), new Rectangle(8, 8, 4, 8)));
			button.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("selected-button.png"), new Rectangle(8, 8, 4, 8)));
			button.disabledSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("disable-button.png"), new Rectangle(8, 8, 4, 8)));
			button.disabledLabelProperties.textFormat = setTextRenderer(QUARK_B_FONT, 20, 0x808080).textFormat;

			button.padding = 5;
			button.paddingLeft = button.paddingRight = 20;
			button.labelFactory = function():TextFieldTextRenderer
			{
				return setTextRenderer(QUARK_B_FONT, 20, 0xffffff);
			}
		}

		private function setToggleButton(togglebutton:ToggleButton):void
		{
			togglebutton.defaultSkin = new Quad(1,1,0x2c3e50);
			togglebutton.disabledSkin = new Quad(1,1,0xcecece);
			togglebutton.selectedHoverSkin = togglebutton.hoverSkin = new Quad(1,1,0x3d5771);
			togglebutton.selectedUpSkin = new Quad(1,1,0x1d2935);
			
			togglebutton.padding = 15;
			
			togglebutton.labelFactory = function():TextFieldTextRenderer{
				return setTextRenderer(QUARK_B_FONT,20,0xffffff);
			}
		}

		private function setScrollbar(scrollbar:ScrollBar):void
		{

			scrollbar.decrementButtonFactory = scrollbar.incrementButtonFactory = scrollbar.thumbFactory = function():Button
			{
				var btn:Button = new Button;

				btn.styleProvider = new FunctionStyleProvider(btnStyle);

				return btn;
			}

			function btnStyle(button:Button):void
			{
				button.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				button.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				button.labelFactory = function():TextFieldTextRenderer
				{
					return setTextRenderer(QUARK_B_FONT, 20, 0x000000);
				}
			}
		}

		private function setInputText(textInput:TextInput):void
		{
			textInput.textEditorFactory = function():TextFieldTextEditor
			{
				return setTextEditor(QUARK_B_FONT, 20, 0xacacac);
			};
			textInput.promptFactory = function():TextFieldTextRenderer
			{
				return setTextRenderer(QUARK_B_FONT, 20, 0x808080);
			};

			textInput.backgroundSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-textinput.png"), new Rectangle(14, 14, 22, 22)));
			textInput.backgroundDisabledSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("disable-textinput.png"), new Rectangle(14, 14, 22, 22)));
			textInput.backgroundFocusedSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("selected-textinput.png"), new Rectangle(14, 14, 22, 22)));
			textInput.paddingLeft = textInput.paddingRight = 15;
		}

		private function setLabel(label:Label):void
		{
			label.textRendererFactory = function():TextFieldTextRenderer
			{
				return setTextRenderer(QUARK_B_FONT, 20, 0x808080);
			}
		}

		private function setTabar(tabbar:TabBar):void
		{
			tabbar.distributeTabSizes = true;
		}

		private function setPanel(panel:Panel):void
		{
			panel.backgroundSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-panel.png"), new Rectangle(14, 14, 22, 22)));
			panel.padding = 15;

			panel.filter = BlurFilter.createDropShadow(4, 0.785, 0, 0.05);
		}

		private function setProgressBar(progressBar:ProgressBar):void
		{
		}

		private function setList(list:List):void
		{
		}

		private function setSpinnerList(spinnerList:SpinnerList):void
		{
		}

		private function setPageIndicator(pageIndicator:PageIndicator):void
		{
			pageIndicator.normalSymbolFactory = function():DisplayObject
			{
				return new Image(_atlas.getTexture("default-pageindicator.png"));
			}

			pageIndicator.selectedSymbolFactory = function():DisplayObject
			{
				return new Image(_atlas.getTexture("selected-pageindicator.png"));
			}
		}

		private function setScrollText(scrollText:ScrollText):void
		{
			scrollText.textFormat = setTextRenderer(QUARK_L_FONT, 20, 0x2c3e50).textFormat;

			/*scrollText.verticalScrollBarFactory = function():ScrollBar
			{
				var scrollbar:ScrollBar = new ScrollBar;

				scrollbar.direction = ScrollBar.DIRECTION_VERTICAL;

				scrollbar.liveDragging = true;

				scrollbar.minimumTrackProperties.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				scrollbar.minimumTrackProperties.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));

				scrollbar.maximumTrackProperties.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				scrollbar.maximumTrackProperties.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));

				scrollbar.decrementButtonProperties.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				scrollbar.decrementButtonProperties.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));

				scrollbar.thumbProperties.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
				scrollbar.thumbProperties.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));

				return scrollbar;
			}*/
		}

		private function btnStyle(button:Button):void
		{
			button.defaultSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
			button.downSkin = new Scale9Image(new Scale9Textures(_atlas.getTexture("default-scrollbar.png"), new Rectangle(5, 5, 10, 10)));
			button.labelFactory = function():TextFieldTextRenderer
			{
				return setTextRenderer(QUARK_B_FONT, 20, 0x000000);
			}
		}

		private function setAlert(alert:Alert):void
		{
		}
		
		private function setCallout(callout:Callout):void
		{
			callout.rightArrowSkin = new Image(_atlas.getTexture("callout-r.png"));
			callout.leftArrowSkin = new Image(_atlas.getTexture("callout-l.png"));
			callout.bottomArrowSkin = new Image(_atlas.getTexture("callout-d.png"));
			callout.topArrowSkin = new Image(_atlas.getTexture("callout-t.png"));
			callout.backgroundSkin = new Quad(1,1,0xffffff);
			callout.padding = 15;
			
			callout.filter = BlurFilter.createDropShadow(4, 0.785, 0, 0.05);
		}

	}
}
