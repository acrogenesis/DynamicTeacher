# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :foundation, class: :input, hint_class: :field_with_hint, error_class: :error do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    # b.use :label_input
    b.use :error, wrap_with: { tag: :small }

    b.wrapper :my_wrapper, tag: :div, class: 'row' do |c|
      c.wrapper tag: :div, class: 'small-2 columns' do |d|
        d.use :label
        d.use :small, wrap_with: { tag: :small }
      end
      # c.use :label, wrap_with: { tag: :div, class: 'large-3 columns' }
      # c.use :small, wrap_with: { tag: :small }
      c.use :input, wrap_with: { tag: :div, class: 'small-10 medium-8 columns end' }
    end
  end

  # CSS class for buttons
  config.button_class = 'small radius button'

  # CSS class to add for error notification helper.
  config.error_notification_class = 'alert-box alert'

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :foundation
end
