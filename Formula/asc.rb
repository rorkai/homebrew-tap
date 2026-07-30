# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.3.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.3.0/asc_3.3.0_macOS_arm64'
      sha256 '1743fb62cf29d4be30ba087442d7a0dcb25576b7c68b97295032889c06987198'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.3.0/asc_3.3.0_macOS_amd64'
      sha256 '0fa0b650c491e95f215c06866aedb9fc92091ae3ada508a0abb863073648f4f1'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
