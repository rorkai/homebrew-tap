# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.17.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.17.0/asc_5.17.0_macOS_arm64'
      sha256 '12dcc37c4d5e8143548256a5eb716e738fbaffd5dbf6bf0376c5dd0abc657619'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.17.0/asc_5.17.0_macOS_amd64'
      sha256 'facb2a673b766aa87131cba56fc4a2f628ccbe1817a0aab7f9e65345047642ee'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.17.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.17.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
