require 'active_support/inflector'

class Rails::FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_form_file
    template 'form.rb', "app/forms/#{file_name}_form.rb"
  end

  def copy_form_test_file
    if options.test_suite == 'rspec'
      template 'form_spec.rb', "spec/forms/#{file_name}_form_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'form_test.rb', "test/forms/#{file_name}_form_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end