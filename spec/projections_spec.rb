require 'helper'

describe Projector do
  it 'has a version number' do
    expect(Projector::VERSION).not_to be nil
  end

  describe 'Projections' do
    before do
      @projections = Projector::Projections.new
    end

    it 'exists' do
      expect(@projections).not_to be nil
    end

    describe 'Command handling' do
      before do
        write_fixtures({
          "*/*" => {
            "type" => "test"
          }
        })
        @projections.load_file fixture_path
      end

      it 'loads the list of commands' do
        expect(@projections.commands).to eq ['test']
      end

      it 'has a method to check if a given command exists' do
        expect(@projections.has_command? 'test').to be true
        expect(@projections.has_command? 'toast').to be false
      end
    end
  end
end
