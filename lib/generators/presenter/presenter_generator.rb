require 'active_support/inflector'

class Rails::PresenterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_presenter_file
    template 'presenter.rb', "app/presenters/#{file_name}_presenter.rb"
  end

  def copy_presenter_test_file
    if options.test_suite == 'rspec'
      template 'presenter_spec.rb', "spec/presenters/#{file_name}_presenter_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'presenter_test.rb', "test/presenters/#{file_name}_presenter_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end