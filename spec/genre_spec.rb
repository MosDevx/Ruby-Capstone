require_relative 'spec_helper'

describe 'genre' do
    before(:each) do
        @genre = Genre.new('Pop')
    end

    context 'testing Genre class' do
        it 'create the instance of Genre class' do
            expect(@genre).to be_an_instance_of(Genre)
        end
    end
end
