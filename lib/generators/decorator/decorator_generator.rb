require "active_support/inflector"

class Rails::DecoratorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_decorator_file
    template 'decorator.rb', "app/decorators/#{file_name}_decorator.rb"
  end

  def copy_decorator_test_file
    if options.test_suite == 'rspec'
      template 'decorator_spec.rb', "spec/decorators/#{file_name}_decorator_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'decorator_test.rb', "test/decorators/#{file_name}_decorator_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end