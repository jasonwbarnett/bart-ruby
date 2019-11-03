# frozen_string_literal: true

require "bart/station"

describe Bart::Station do
  subject { described_class.new(abbreviation: abbreviation) }

  let(:abbreviation) { "12TH" }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:abbreviation) }
end
