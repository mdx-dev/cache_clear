require 'spec_helper'

describe 'clearing the cache', type: :request, cache: true do
  def clear_cache
    delete '/cache_clear', params
  end

  context 'with data in the cache' do
    before do
      Rails.cache.write('foo', 'bar')
      expect(Rails.cache.read('foo')).to eq('bar')
    end

    context 'when authorization is not required' do
      let(:params) {{}}

      before do
        clear_cache
      end

      it 'returns OK' do
        expect(response.status).to eq(200)
      end

      it 'clears the cache' do
        expect(Rails.cache.read('foo')).not_to eq('bar')
      end
    end

    context 'when authorization is required' do
      let(:auth_token) { 'foobarbazquux' }

      before do
        CacheClear.configure do |config|
          config.auth_token = auth_token
        end
        clear_cache
      end

      context 'when authorization is passed in' do
        let(:params) {{ auth_token: auth_token}}

        it 'clears the cache' do
          expect(Rails.cache.read('foo')).not_to eq('bar')
        end

        it 'returns OK' do
          expect(response.status).to eq(200)
        end
      end

      context 'when authorization is not passed in' do
        let(:params) {{}}
        before do
          clear_cache
        end

        it 'does not clear the cache' do
          expect(Rails.cache.read('foo')).to eq('bar')
        end

        it 'returns unauthorized' do
          expect(response.status).to eq(401)
        end
      end

      context 'when bad authorization is not passed in' do
        let(:params) {{ auth_token: 'bad' }}
        before do
          clear_cache
        end

        it 'does not clear the cache' do
          expect(Rails.cache.read('foo')).to eq('bar')
        end

        it 'returns unauthorized' do
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
