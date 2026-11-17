# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.0.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.0.0/asc_7.0.0_macOS_arm64'
      sha256 '7d87149508749a1ccf5684d4465f19a3b10ed2b5ba274e580aadb5e60b050a4c'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.0.0/asc_7.0.0_macOS_amd64'
      sha256 '08c530367c00ba527edaafa8d421412d9f333801da197be98fabf905b0d05f58'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.0.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.0.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
