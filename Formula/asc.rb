# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.7'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.7/asc_1.2.7_macOS_arm64'
      sha256 '2bb2611bd866588cd55c87130fdbdd65cd66460ece6054305c9741749ec3da2e'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.7/asc_1.2.7_macOS_amd64'
      sha256 '40447eac1ae559d5685b3b5fe26723ffcb3d94af6c42439778691b4ff641d093'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.7_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.7_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
