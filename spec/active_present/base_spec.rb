require 'spec_helper'

module ActivePresent
  describe Base do
    let(:template) { double('templae', root_path: '/') }
    let(:object) { double('object') }
    subject { Base.new object, template }

    describe '#object' do
      it 'returns instance of object' do
        expect(subject.object).to eq object
      end
    end

    describe '#template' do
      it 'returns view context' do
        expect(subject.template).to eq template
      end
    end

    describe 'when method not exist' do
      it 'delegates to template' do
        expect(subject.root_path).to eq '/'
      end
    end

    describe '.presents' do
      it 'returns model' do
        subject.class.presents(:user)
        expect(subject.user).to eq object
      end
    end
  end
end