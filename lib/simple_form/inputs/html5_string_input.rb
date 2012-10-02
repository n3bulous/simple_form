module SimpleForm
  module Inputs
    class Html5StringInput < Base
      HTML5_TYPES = [:html5_date, :html5_datetime, :html5_time]

      def input
        #input_html_classes.reject! {|klass| HTML5_TYPES.include?(klass) }
        input_html_options[:type] ||= input_type.to_s.sub(/^html5_/, '') if html5?
        @builder.text_field(attribute_name, input_html_options)
      end
    end
  end
end
