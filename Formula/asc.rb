# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.4.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.1/asc_1.4.1_macOS_arm64'
      sha256 '233885d3d7572313646721c89413edf4b050ee75a55876f5e78767256e464a29'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.1/asc_1.4.1_macOS_amd64'
      sha256 '832c2e690ffb43d8a7bd74f28bc0a051186c91f656bd92071a4c90a54b4ff0dc'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.4.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.4.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
