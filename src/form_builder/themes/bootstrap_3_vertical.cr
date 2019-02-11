module FormBuilder
  class Themes
    class Bootstrap3Vertical < Themes

      def self.theme_name
        "bootstrap_3_vertical"
      end

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, html_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          wrapper_html_attributes["class"] = "form-group#{" has-error" if html_errors} #{wrapper_html_attributes["class"]?}".strip

          attr_str = FormBuilder.build_html_attr_string(wrapper_html_attributes)
          s << "#{attr_str.empty? ? "<div>" : %(<div #{attr_str}>)}"

          if {"checkbox", "radio"}.includes?(field_type)
            if html_label
              s << html_label.sub("\">", "\">#{html_field} ")
            else
              s << html_field
            end
          else
            s << html_label
            s << html_field
          end

          s << html_help_text
          s << html_errors.join if html_errors

          s << "</div>"
        end
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String, has_errors? : Bool)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String, has_errors? : Bool)
        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs
      end

      def build_html_help_text(help_text : String, html_attrs : StringHash, field_type : String)
        html_attrs["class"] = "help-block #{html_attrs["class"]?}".strip

        String.build do |s|
          s << (html_attrs.empty? ? "<span>" : %(<span #{FormBuilder.build_html_attr_string(html_attrs)}>))
          s << help_text
          s << "</span>"
        end
      end

      def build_html_error(error : String, html_attrs : StringHash, field_type : String)
        html_attrs["class"] = "help-block #{html_attrs["class"]?}".strip

        String.build do |s|
          s << (html_attrs.empty? ? "<span>" : %(<span #{FormBuilder.build_html_attr_string(html_attrs)}>))
          s << error
          s << "</span>"
        end
      end

    end
  end
end
