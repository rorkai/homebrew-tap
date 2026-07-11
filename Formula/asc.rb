# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.8.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.0/asc_2.8.0_macOS_arm64'
      sha256 'e3802da963ee052b60c578986d28a08048c2d62ed36ea38c0d3bff4a110289b3'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.0/asc_2.8.0_macOS_amd64'
      sha256 '3741e2b180a948813879cd0bf92fe690367a0e058c3bd6890509f8886082c94c'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.8.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.8.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
