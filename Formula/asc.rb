# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.7.0/asc_4.7.0_macOS_arm64'
      sha256 'a4b5ab178c9acb366f45e44d3eac2f97ddd4141a3ddac610f0e5e4d46d48aab9'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.7.0/asc_4.7.0_macOS_amd64'
      sha256 '59376378d05ed7d1b315a687eb5331ed88b4cb60b55594c615703e23675ac7db'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
