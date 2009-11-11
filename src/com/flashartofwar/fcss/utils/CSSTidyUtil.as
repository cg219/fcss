package com.flashartofwar.fcss.utils
{

	/**
	 * <p>CSSTidyUtil uses regex to remove spaces, breaks, "px" and other items
	 * that the F*CSS's parser doesn't know how to handle. This also shrinks
	 * the CSS filesize substatually to help speed up parsing.</p>
	 *
	 * <p>In most cases it is better to do this on the server then in Flash at
	 * run time. You can simply take this regex and run it through php or some
	 * other server side language.</p>
	 *
	 * @author jessefreeman
	 */
	public class CSSTidyUtil
	{

		protected static const COMPRESS_CSS:RegExp = /\s*([@{}:;,]|\)\s|\s\()\s*|\/\*([^*\\\\]|\*(?!\/))+\*\/|[\n\r\t]|(px)|(%)/g;
		protected static const OPENING_BRACKET:RegExp = /({)/g;
		protected static const SINGLE_CSS_LINE:RegExp = /(;)/g;
		protected static const CSS_PROPERTY_DIVIDER:RegExp = /(:)/g;
		protected static const CLOSING_BRACKET:RegExp = /\t(})/g;

		/**
		 * <p>This uses regex to remove spaces, breaks, "px" and other items
		 * that the F*CSS's parser doesn't know how to handle and returns a clean
		 * string.</p>
		 *
		 * @param cssText
		 * @return
		 */
		public static function tidy(cssText:String):String
		{
			return cssText.replace(COMPRESS_CSS, "$1");
		}
		
		public static function format(cssText:String):String
		{
			var unTidyText:String = cssText.replace(OPENING_BRACKET, "\n$1\n\t");
			unTidyText = unTidyText.replace(SINGLE_CSS_LINE, "$1\n\t");
			unTidyText = unTidyText.replace(CSS_PROPERTY_DIVIDER, " $1 ");
			unTidyText = unTidyText.replace(CLOSING_BRACKET, "$1\n\n");
			return unTidyText;
		}
	}
}

