# frozen_string_literal: true

RSpec.shared_examples 'getable unit' do |url|
  describe '.get' do
    subject { described_class.get(id) }
    let(:body) { file_fixture("#{model_name}/get.json") }
    let(:headers) { { 'Content-Type' => 'application/json' } }
    let(:id) { '1' }

    before { stub_request(:get, url).to_return(body: body, headers: headers) }

    it "returns the #{described_class}" do
      expect(subject).to be_a described_class
    end
  end
end
