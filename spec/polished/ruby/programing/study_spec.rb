# frozen_string_literal: true

RSpec.describe Polished::Ruby::Programing::Study::A do
  it "has a version number" do
    expect(Polished::Ruby::Programing::Study::VERSION).not_to be nil
  end

  describe '#define_method' do
    context 'when user_name' do
      it 'returns its entity name' do
        klass_a = described_class.new
        expect(klass_a.user_name).to eq('user name')
      end
    end

    context 'when admin_name' do
      it 'returns its entity name' do
        klass_a = described_class.new
        expect(klass_a.admin_name).to eq('admin name')
      end
    end

    context 'when customer_name' do
      it 'returns its entity name' do
        klass_a = described_class.new
        expect(klass_a.customer_name).to eq('customer name')
      end
    end

    context 'when welcome with arg' do
      it 'returns welcome Felipe name' do
        klass_a = described_class.new

        expect(klass_a.welcome('Felipe')).to eq('Welcome, Felipe!')
      end
    end
  end
end
