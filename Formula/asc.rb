# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.14.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.1/asc_5.14.1_macOS_arm64'
      sha256 'da5bd4a0aa52b1a1a04f5c2480d03f1e74ba53ec02410186ee2503c262109642'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.1/asc_5.14.1_macOS_amd64'
      sha256 '74324b37c7cbf3b75aef445665b5fd1f2de7141fc671ef047f8c561737ba9695'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.14.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.14.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
