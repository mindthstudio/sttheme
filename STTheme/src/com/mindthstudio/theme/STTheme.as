package com.mindthstudio.theme
{
	import feathers.controls.Alert;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.Panel;
	import feathers.controls.ProgressBar;
	import feathers.controls.ScrollBar;
	import feathers.controls.SpinnerList;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleButton;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import feathers.skins.FunctionStyleProvider;

	import starling.core.Starling;

	/**
	 * @author : mindth studio
	 */
	public class STTheme
	{
		public function STTheme()
		{
			// set background
			Starling.current.nativeStage.color = 0xeeeeee;

			// default
			FeathersControl.defaultTextRendererFactory = setTextRenderer;
			FeathersControl.defaultTextEditorFactory = setTextEditor;

			// set style
			Header.globalStyleProvider = new FunctionStyleProvider(setHeader);
			Button.globalStyleProvider = new FunctionStyleProvider(setButton);
			ToggleButton.globalStyleProvider = new FunctionStyleProvider(setToggleButton);
			ScrollBar.globalStyleProvider = new FunctionStyleProvider(setScrollbar);
			TextInput.globalStyleProvider = new FunctionStyleProvider(setInputText);
			Label.globalStyleProvider = new FunctionStyleProvider(setLabel);
			TabBar.globalStyleProvider = new FunctionStyleProvider(setTabar);
			Panel.globalStyleProvider = new FunctionStyleProvider(setPanel);
			ProgressBar.globalStyleProvider = new FunctionStyleProvider(setProgressBar);
			PageIndicator.globalStyleProvider = new FunctionStyleProvider(setPageIndicator);

			// Todo here 
			// List.globalStyleProvider = new FunctionStyleProvider(setList);
			// SpinnerList.globalStyleProvider = new FunctionStyleProvider(setSpinnerList);
			// Alert.globalStyleProvider = new FunctionStyleProvider(setAlert);
		}

		// factory ================================================================

		private function setTextEditor():TextFieldTextEditor
		{
			var _textFieldTextEditor:TextFieldTextEditor = new TextFieldTextEditor;

			return _textFieldTextEditor;
		}

		private function setTextRenderer():TextFieldTextRenderer
		{
			var _textFieldTextRenderer:TextFieldTextRenderer = new TextFieldTextRenderer;

			return _textFieldTextRenderer;
		}

		// style ===================================================================

		private function setButton(Button):void
		{
		}

		private function setHeader(Header):void
		{
		}

		private function setToggleButton(ToggleButton):void
		{
		}

		private function setScrollbar(ScrollBar):void
		{
		}

		private function setInputText(TextInput):void
		{
		}

		private function setLabel(Label):void
		{
		}

		private function setTabar(TabBar):void
		{
		}

		private function setPanel(Panel):void
		{
		}

		private function setProgressBar(ProgressBar):void
		{
		}

		private function setList(List):void
		{
		}

		private function setSpinnerList(SpinnerList):void
		{
		}

		private function setPageIndicator(PageIndicator):void
		{
		}

		private function setAlert(Alert):void
		{
		}
	}
}
