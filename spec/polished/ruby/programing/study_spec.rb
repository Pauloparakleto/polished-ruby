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

# Implementing an in-memory database
RSpec.describe Polished::Ruby::Programing::Study::InMemoryDatabase do
  describe '#initialize' do
    it 'is true' do
      expect(described_class.new).to be_truthy
    end
  end

  describe '#albun_artists' do
    it 'is truthy' do
      expect(described_class.new.albun_artists).to be_truthy
    end

    it 'is truthy' do
      expect(described_class.new.albun_track_artists).to be_truthy
    end
  end

  #flat_map
  describe '#flat_map' do
    context 'when no block is given an enumerator is returned' do
      it 'returns each element together with its negative value' do
        array = [1, 2, 3]
  
        expect(array.flat_map { |element| [element, -element] }).to eq([1, -1, 2, -2, 3, -3])
      end
    end

    context 'when wanting to extract some element from an array of an array' do
      it 'returns only the last element in a new array' do
        array_of_array = [[1, 2], [3, 4]]
        expect(array_of_array.flat_map { |element_array| element_array.last}).to eq([2, 4])
      end
    end
  end
  #Set core class
  #lambda sample
  #Proc Sample
  #array intersection [] & [] sample
  describe '#lookup' do
    it 'returns only artist stored in memory database' do
      expect(described_class.new.search('Artist 0')).to be_truthy
    end
  end
end
