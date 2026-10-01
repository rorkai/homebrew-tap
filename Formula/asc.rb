# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.9.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.0/asc_5.9.0_macOS_arm64'
      sha256 '6d46e477c565d45972decbde84d055eb028874a1c8322a450355b98b629ba382'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.0/asc_5.9.0_macOS_amd64'
      sha256 'c293cdce9c4b9e0d6e0627a26cabf6843cfe93f28a1c69ffa49bca5d849a0691'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.9.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.9.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
