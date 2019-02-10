module FormBuilder
  class Themes
    class SemanticUIVertical < Themes

      def self.theme_name
        "semantic_ui_vertical"
      end

      def wrap_field(field_type : String, html_label : String?, html_field : String, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        "Foo to the Bar"
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs
      end

    end
  end
end
