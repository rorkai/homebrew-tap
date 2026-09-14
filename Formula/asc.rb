# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.3.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.1/asc_5.3.1_macOS_arm64'
      sha256 '77abb3ae356b0d742e13b30129ddb36ebf0d41bee6a2df56b235e6489a1fb822'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.1/asc_5.3.1_macOS_amd64'
      sha256 '8499694eaed97ebd0233e2c7265630d30e11822d002c821bd4a206b226175648'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.3.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.3.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
