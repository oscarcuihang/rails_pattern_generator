require 'rails_helper'

RSpec.describe <%= class_name + 'Presenter' %> do
  RECORDS_PER_PAGE = 30

  let(:params_page) { 1 }

  let(:params) { {page: params_page} }
  subject(:presenter) { <%= class_name + 'Presenter' %>.create(params) }

  describe '.create' do
    content 'with basic params' do
      let(:mock_presenter) { double('<%= class_name + 'Presenter' %>') }

      before do
        allow(<%= class_name + 'Presenter' %>).to receive(:new).with(params).and_return(mock_presenter))
      end

      it 'returns a <%= class_name + 'Presenter' %> instance create by .new method' do
        is_expected.to eql(mock_presenter)
      end
    end
  end

  describe '#initialize' do
  end
end
