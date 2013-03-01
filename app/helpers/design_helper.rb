module DesignHelper
  
  # Creats an icon wrapper, can also be used for Bootstrap.
  # taken from Insight Emissions Management Inc.
  # http://www.apache.org/licenses/LICENSE-2.0
  #
  # @param [String] name Icon name from Bootstrap's Glyphicons. Automatically prefixes the name
  #   with 'icon-' if not done already.
  # @param [Hash] options
  #
  # @option options [Boolean] white (false) Set to true if you want a white icon.
  # @option options [String] class ('') Set any classes you want for the icon here.
  #   a bit nicer.
  #
  # @return [HTML]
  #
  # @see http://twitter.github.com/bootstrap/base-css.html#icons Bootstrap Icons
  #
  def icon_tag name, options = {}
    name = name.to_s
    options.reverse_merge!( white: false )
  
    name.insert( 0, 'icon-' ) unless name.starts_with?( 'icon-' )  # Add prefix for bootstrap.
  
    klass = [name]
    klass << 'icon-white' if options[:white]
    klass << options[:class]
    
    if options[:nows]
      nows = true
      options.delete(:nows)
    end
  
    content_tag(:i, nil, class: klass.join( ' ' ) ) + (nows ? "" : "&nbsp;").html_safe
  end
  
end