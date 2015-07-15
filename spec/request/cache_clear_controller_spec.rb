require 'spec_helper'

describe 'clearing the cache', type: :request, cache: true do
  context 'with data in the cache' do
    before do
      Rails.cache.write('foo', 'bar')
      expect(Rails.cache.read('foo')).to eq('bar')
    end

    it 'clears the cache' do
      delete '/cache_clear'
      expect(Rails.cache.read('foo')).not_to eq('bar')
    end
  end
end
