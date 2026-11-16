# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'apt::backports' do
  context 'when using defaults' do
    let(:pp) do
      <<-MANIFEST
        include apt::backports
      MANIFEST
    end

    it 'applies idempotently' do
      retry_on_error_matching do
        expect { idempotent_apply(pp) }.not_to raise_error
      end
    end

    it 'provides backports apt sources' do
      expect { run_shell('apt-cache policy | grep --quiet backports') }.not_to raise_error
    end
  end
end
