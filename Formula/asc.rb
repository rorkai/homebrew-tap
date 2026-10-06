# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.12.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.12.1/asc_5.12.1_macOS_arm64'
      sha256 '1b60df9619f3c21d05f6aa066baa781373d6373f87d8b6ccfc0625affe79acd9'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.12.1/asc_5.12.1_macOS_amd64'
      sha256 '4bb102dffa347eb76633ed64c05db01715a1cf719164d5a048db4870e3b6f77e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.12.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.12.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
