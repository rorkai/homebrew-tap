# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.13.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.13.0/asc_5.13.0_macOS_arm64'
      sha256 '9dd0b127563f9a1bf7e4113ea244f11a2813e2ebfd1841182bf2913431053393'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.13.0/asc_5.13.0_macOS_amd64'
      sha256 '94433789f807548ddcd0e854eeb67d9dfd768a9cf52718a20f8b5a39aaefbc18'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.13.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.13.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
