# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'apt class' do
  context 'with default parameters' do
    # Using puppet_apply as a helper
    it 'works with no errors' do
      pp = <<-MANIFEST
      class { 'apt': }
      MANIFEST

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      expect { apply_manifest(pp, catch_changes: true) }.not_to raise_error
    end
  end
end
