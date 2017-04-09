class <%= class_name %>Presenter < SimpleDelegator

  RECORDS_PER_PAGE = 30

  attr_reader :total_page, :current_page_num, :records_on_current_page

  def self.create(params)
    return if params.nil
    new(params)
  end

  def initialize(params)

  end
end
