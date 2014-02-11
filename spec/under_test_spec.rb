require 'spec_helper'
require_relative '../under_test'

describe UnderTest do
  describe '.some_method' do
    let!(:stubbed_class) { class_double("Stubbed").as_stubbed_const }

    subject { described_class.some_method }

    before do
      class_double("Stubbed::SomeError").as_stubbed_const
      allow(stubbed_class).to receive(:some_method).and_raise(Stubbed::SomeError)
    end

    it "raises the error" do
      expect(subject).to be_nil
    end
  end
end
