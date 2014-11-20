module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Small
      # Name of the component method
      def small(_wrapper_options = nil)
        @small ||= begin
          options[:small].to_s.html_safe if options[:small].present?
        end
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Small)
