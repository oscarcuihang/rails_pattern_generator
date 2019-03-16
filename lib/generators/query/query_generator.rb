require 'active_support/inflector'

class Rails::QueryGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_query_file
    template 'query.rb', "app/queries/#{file_name}_query.rb"
  end

  def copy_query_test_file
    if options.test_suite == 'rspec'
      template 'query_spec.rb', "spec/queries/#{file_name}_query_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'query_test.rb', "test/queries/#{file_name}_query_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end