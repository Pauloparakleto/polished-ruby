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
        expect(array_of_array.flat_map(&:last)).to eq([2, 4])
      end
    end
  end
  #Set core class
  # yield keyword
  describe '#yield' do
    context 'when called once' do
      def print_once
        yield
      end

      it 'execute anything inside the block' do
        result = 'the block will be called by yield'
        expect(print_once { result }).to eq(result)
      end
    end

    context 'when called twice' do
      def once_twice_time_human_modifier(index)
        return 'once' if index.eql?(1)
        return 'twice' if index.eql?(2)
        
        'times'
      end

      def print_twice
        block_given_twice = [yield, yield]
        block_given_twice.map!.with_index(offset=1){ |message, index| message + ' ' + once_twice_time_human_modifier(index) }
      end

      it 'execute anything inside the block' do
        result = 'the block will be called by yield'
        expect(print_twice { result }).to eq(['the block will be called by yield once', 'the block will be called by yield twice'])
      end
    end
  end
  #lambda sample
  describe '#lambda' do
    context 'without argument' do
      it 'says something I do not know' do
        my_lambda = -> { 'Say something I do not know' }

        expect(my_lambda.call).to eq('Say something I do not know')
      end
    end

    context 'with correct number of arguments given' do
      it 'double number' do
        times_two = -> (number){ number * 2 }

        expect(times_two.call(5)).to eq(10)
      end
    end

    context 'with wrong number of arguments given' do
      it 'raises ArgumentError with specific message' do
        times_two = -> (number){ number * 2 }

        expect{times_two.call}.to raise_error(ArgumentError, 'wrong number of arguments (given 0, expected 1)')
      end
    end

    context 'when the return keyword is used' do
      it 'returns 1' do
        my_lambda = -> { return 1 }

        expect(my_lambda.call).to eq(1)
      end
    end
  end
  #Proc Sample
  describe '#Proc' do
    context 'without argument' do
      it 'says Proc does not care about argument' do
        my_proc = Proc.new { |name| 'Proc does not care about argument' }

          expect(my_proc.call).to eq('Proc does not care about argument')
      end
    end

    context 'with correct number of arguments given' do
      it 'double number' do
        proc_times_two = Proc.new { |number| number * 2 }

        expect(proc_times_two.call(5)).to eq(10)
      end
    end

    context 'with wrong number of arguments given' do
      it 'does not raise ArgumentError with specific message' do
        proc_times_two = Proc.new { |number| number * 2 }

        expect{ proc_times_two.call }.not_to raise_error(ArgumentError, 'wrong number of arguments (given 0, expected 1)')
        expect{ proc_times_two.call }.to raise_error(NoMethodError, "undefined method `*' for nil:NilClass")
      end
    end

    context 'when the return keyword is used' do
      my_proc = Proc.new { return 1 }

      it 'returns 1' do
        expect{my_proc.call}.to raise_error(LocalJumpError, 'unexpected return')
      end

      context 'and it is inside a method' do
        def return_proc_inside_method
          'first return'
          my_proc = Proc.new { return 2 }
          my_proc.call
          'second return'
        end
  
        it 'returns 2' do
          expect(return_proc_inside_method).to eq(2)
        end

        it 'does not returns second return string' do
          expect(return_proc_inside_method).not_to eq('second return')
        end
      end
    end
  end

  #array intersection [] & [] sample
  describe '#lookup' do
    it 'returns only artist stored in memory database' do
      expect(described_class.new.search('Artist 0')).to be_truthy
    end
  end
end
