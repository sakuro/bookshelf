# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Books::Create do
  context "when given both title and author" do
    let(:params) { Hash[book: {title: "The Murders in the Rue Morgue", author: "Edgar Allan Poe"}] }

    it "succeeds" do
      response = subject.call(params)
      expect(response).to be_redirect
    end
  end

  context "when title is missing" do
    let(:params) { Hash[book: {author: "Edgar Allan Poe"}] }

    it "fails" do
      response = subject.call(params)
      expect(response).to be_bad_request
    end
  end

  context "when author is missing" do
    let(:params) { Hash[book: {title: "The Murders in the Rue Morgue"}] }

    it "fails" do
      response = subject.call(params)
      expect(response).to be_bad_request
    end
  end
end
