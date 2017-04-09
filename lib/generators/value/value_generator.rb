require "active_support/inflector"

class Rails::ValueGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_value_file
    template 'value.rb', "app/values/#{file_name}_policy.rb"
  end

  def copy_value_test_file
    if options.test_suite == 'rspec'
      template 'value_spec.rb', "spec/values/#{file_name}_value_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'value_test.rb', "test/values/#{file_name}_value_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end