require 'spec_helper'

module ActivePresent
  describe PresenterHelper do
    let(:user) { create('user') }
    let(:article) { create('article') }

    let(:view_context) { ApplicationController.new.view_context }

    describe '#present' do
      it 'is included in the view' do
        expect(view_context.methods).to include :present
      end

      it 'returns a presenter object' do
        user_presenter = view_context.present(user)
        expect(user_presenter.class).to eq UserPresenter
      end

      it 'returns a explicit presenter object' do
        user_presenter = view_context.present(article, ArticlePresenter)
        expect(user_presenter.class).to eq ArticlePresenter
      end

      context 'when presenter not exist' do
        it 'returns raise error' do
          string = 'hello World'
          expect{ view_context.present(string) }.to raise_error(NameError)
        end
      end
    end
  end
end