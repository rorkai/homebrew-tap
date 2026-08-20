# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.6.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.6.1/asc_4.6.1_macOS_arm64'
      sha256 'e48595ccdc20120783e1ad8852b3e57200544b2b754cc1a279c3bb617ab66121'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.6.1/asc_4.6.1_macOS_amd64'
      sha256 'fb4bc08d193989774a198d31c71cc1ed0c23e9e820b9782bd49d2ef12246c941'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
